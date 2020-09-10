#!/bin/bash

SORCnam=$(pwd)
 MACHID=dell

if [ "${MACHID}" = dell ]; then
. /usrx/local/prod/lmod/lmod/init/bash

elif [ "${MACHID}" = theia ]; then
module use -a /scratch3/NCEPDEV/nwprod/lib/modulefiles
fi
module purge
module use -a ../modulefiles/${MACHID}
module load build/v4.0.0_build

set -x
export OUTmain=`dirname $(readlink -f ../exec/${MACHID}.exec/ )`
export OUTDIR=${OUTmain}/${MACHID}.exec

make -f ./Makefile clean

# Clean post0 code
cd ${SORCnam}/nam_post0.fd
./build_post0_clean.sh

# Clean ncep post
cd ${SORCnam}/nam_nceppost.fd/sorc
./build_ncep_post.sh_cleanonly > build_post.log 2>> build_post.log

# Clean nam_nems_nmmb.fd
cd ${SORCnam}/nam_nems_nmmb.fd/src
./clean.sh

#clean nam_land_utilities
cd ${SORCnam}/nam_land_utilities.fd/sorc
./build_emcsfc.sh_cleanonly > build_emcsfc.log 2>> build_emcsfc.log

# clean NPS code
cd ${SORCnam}/nam_nps.fd/sorc
./build.sh_cleanonly

# remove remaining executables
rm $OUTDIR/*

cd ${SORCnam}

exit 0
