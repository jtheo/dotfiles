#!/usr/bin/env bash

function msg() {
	printf "%(%H:%M:%S)T %s\n" -1 "${*}"
}

function err() {
	msg "${*}"
	exit 1
}

function isIn() {
	local seeking=$1
	shift
	local in=1
	for element; do
		if [[ $element == "$seeking" ]]; then
			in=0
			break
		fi
	done
	return $in
}

function title() {
	case ${1} in
	minor) echo "FEATURE" ;;
	major) echo "BREAKING" ;;
	patch) echo "PATCH" ;;
	esac
}

level=${1}
shift
if [[ -z ${level} ]]; then
	err "I need a level (minor, major, patch)"
fi

validLevels=(major minor patch)

if ! isIn "${level}" "${validLevels[@]}"; then
	err "The level <${level}> is not valid!"
fi

message="${*}"
if [[ -z ${message} ]]; then
	err "I need a message!"
fi

invalidBranches=(master main HEAD)
branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

if isIn "${branch}" "${invalidBranches[@]}"; then
	err "Hey Cowboy! Stop it there! You are in ${branch}, maybe create a feature branch, and then try it again!"
fi

git ci -am "${message}"

releaseFile="${branch}.${level}.release"

cat <<EOF >"${releaseFile}"
$(title "${level}")
 - ${message}
EOF

git add "${releaseFile}"

git commend -a
