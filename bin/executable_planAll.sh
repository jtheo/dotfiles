#!/usr/bin/env bash

source "${HOME}/.dotf/itv"
source "${HOME}/.dotf/functions"

base=${PWD}
start=$(date +%s)
declare -a listDir

for dir in */; do
	if [[ ${dir} =~ params|roles|plans ]]; then
		continue
	fi
	listDir+=("${dir%/}" "${dir}roles")
done

listDir+=(. ./roles)

for dir in "${listDir[@]}"; do
	dest=${base}/${dir}
	printf "\n\n%s ==================== > %s < ===============\n\n" "$(date)" "${dir}"
	cd "${dest}" || (echo "Can't enter in ${dest}" exit 1)
	if [[ ${1} == "-i" ]]; then
		d init
	fi
	d plan
	printf "\n\n\n\n"
done
now=$(date +%s)
echo "${0} Executed in $((now - start)) seconds"
# shellcheck disable=SC2164
cd "${base}"
