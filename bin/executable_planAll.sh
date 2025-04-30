#!/usr/bin/env bash

source "${HOME}/.dotf/itv"
source "${HOME}/.dotf/functions"

base=${PWD}
start=$(date +%s)
declare -a listDir

for d in $(ls -d */); do
  if [[ ${d} =~ params|roles|plans ]]; then
    continue
  fi
  listDir+=("${d%/}" "${d}roles")
done

listDir+=(. ./roles)

for d in "${listDir[@]}"; do
  x=${base}/${d}
  printf "\n\n%s ==================== > %s < ===============\n\n" "$(date)" "${d}"
  cd "${x}" || (echo "Can't enter in ${x}" exit 1)
  d plan
  printf "\n\n\n\n"
done
now=$(date +%s)
echo "Executed in $((now - start))"
