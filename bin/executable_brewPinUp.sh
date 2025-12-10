#!/usr/bin/env bash

function msg() {
	printf "%(%H:%M:%S)T %s\n" -1 "${*}"
}

function err() {
	msg "${*}"
	exit 1
}
if [[ -z ${1} ]]; then
	err "I need a package name"
fi

pkg=${1}

if ! brew list --pinned | grep "${pkg}"; then
	err "Package ${pkg} not found"
fi

for action in unpin upgrade pin; do
	msg "Executing... ${action}"
	brew "${action}" "${pkg}"
done
