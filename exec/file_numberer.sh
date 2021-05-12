#!/bin/bash

file_manifest=$1
file_manifest=file_manifest.txt

declare -a files=($(cat $file_manifest))
echo ${files[@]}

for n in ${!files[@]}; do
  oldfile=${files[n]}
  basename=$(echo $oldfile | sed -r 's/^[0-9]+_//')
  newindex=$n
  if [ $(echo -n $n | wc -c) = 1 ]; then
    newindex='0'$n
  fi
  echo mv $oldfile $newindex'_'$basename
  mv $oldfile $newindex'_'$basename
done
