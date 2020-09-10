#! /usr/bin/env bash
set -eux

cd ..
pwd=$(pwd)
dir_root=$pwd

cd sorc

cwd=`pwd`

cd nam_gsi.fd/GSI/ush
./build_all_cmake.sh "PRODUCTION" "$cwd/nam_gsi.fd/GSI"
###./build_all_cmake.sh "DEBUG" "$cwd/nam_gsi.fd/GSI"

cd ../exec
cp -r global_gsi.x $dir_root/exec/dell.exec/nam_gsi

exit

