#!/usr/bin/env bash

function getVer() {
	component=${1}
	itv_yaml=${2}
	awk -v component="${component}" '{if ($0 ~ component) {found=1; next}; if (found==1) { print $2; exit }}' "${itv_yaml}"
}

function msg() {
	echo "$(date): ${*}"
}

function err() {
	echo "ERROR: ${*}"
	exit 1
}

[[ -e itv.yaml ]] || err "Can't find the main itv.yaml, are you sure you're in the correct dir? Your are in <${PWD}>"

grep -q default_dev_envs: itv.yaml || err "Not sure you're in the right place, there's an itv.yaml, but no default_dev_envs key"

base=${PWD##*/}
product=${base%%-*}
components=(tf-component-aplo tf-component-lambda tf-service-access_control)
if [[ -n ${1} ]]; then
	components=("tf-component-${1}")
fi

max=0
for component in "${components[@]}"; do
	if [[ ${#component} -gt ${max} ]]; then
		max=${#component}
	fi
done

msg "Last versions of the components"
for component in "${components[@]}"; do
	rj=/tmp/${component}-release.json
	curl -sSL \
		-H "Accept: application/vnd.github+json" \
		-H "Authorization: Bearer $(gh auth token)" \
		-H "X-GitHub-Api-Version: 2022-11-28" \
		"https://api.github.com/repos/ITV/${component}/releases" -o "${rj}"
	v=$(jq -rc '.[0].tag_name' "${rj}")
	printf " - %-*s %s\n" "${max}" "${component}:" "${v}"
done

read -r -a services <<<"$(grep -l terraform: */itv.yaml | awk '{printf "%s ",$0}')"
read -r -a columns <<<"$(for s in "${components[@]}"; do printf " %s " "${s##*-}"; done)"

echo
msg "Checking ${#services[@]} services in ${product}"
echo
(
	echo "Service ${columns[*]}"

	for itv_yaml in "${services[@]}"; do
		printf "%s " "${itv_yaml%%/*} "
		for component in "${components[@]}"; do
			ver="$(getVer "${component}" "${itv_yaml}")"
			if [[ ${ver} == "" ]]; then
				ver="-"
			fi
			printf " %s " "${ver}"
		done
		echo
	done
) | column -t
echo
