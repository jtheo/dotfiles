#!/usr/bin/env bash

source "${HOME}/.dotf/itv"
source "${HOME}/.dotf/functions"

start=$(date +%s)
base=${PWD}
for dir in */; do
	dir=${dir%/}
	if [[ ${dir} == "plans" ]]; then continue; fi
	dest=${base}/${dir}
	printf "%(%d-%m-%Y %H:%M:%S)T > =============================================== %s\n" -1 "${dir}"
	# shellcheck disable=SC2164
	cd "${dest}"
	d plan
	printf "\n\n\n\n"
done
# shellcheck disable=SC2164
cd "${base}"

now=$(date +%s)
echo "${0} Executed in $((now - start)) seconds"
