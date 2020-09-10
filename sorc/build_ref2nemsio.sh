#!/bin/bash

set -ex

cd ..
pwd=$(pwd)
dir_root=$pwd

. $MODULESHOME/init/sh
conf_target=nco

[ -d $dir_root/exec ] || mkdir -p $dir_root/exec

dir_modules=$dir_root/modulefiles
module purge
module use $dir_modules/
module load modulefile.nam_ref2nemsio
module list

dir_refsorc=$dir_root/sorc/nam_ref2nemsio.fd
cd $dir_refsorc
export OUTDIR=$dir_root/exec/dell.exec
make -f makefile
