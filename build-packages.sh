#!/usr/bin/env bash

# Set with the flags "-e", "-u","-o pipefail" cause the script to fail
# if certain things happen, which is a good thing.  Otherwise, we can
# get hidden bugs that are hard to discover.
set -euo pipefail

echo "$0"
full_path=$(realpath "$0")
dir_path=${full_path%/*}

readarray -t x86_list <<< "$(find x86_64/ -type f -name PKGBUILD | awk -F / '{print $2}')"

for x in "${x86_list[@]}"
do
    cd "${dir_path}"/x86_64/"${x}"
    echo "### Making ${dir_path}/x86_64/${x} ###"
    makepkg -cf
    # find . -mindepth 1 -maxdepth 1 -type d -print0 | xargs -r0 rm -R
done
