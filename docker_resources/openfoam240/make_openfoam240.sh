#!/bin/bash

set -exo pipefail

# making sure the right mpi is setup for OpenFOAM
ln -s /usr/bin/mpicc.openmpi OpenFOAM-2.4.0/bin/mpicc
ln -s /usr/bin/mpirun.openmpi OpenFOAM-2.4.0/bin/mpirun
sed -i -e 's/^\(cgal_version=\).*/\1cgal-system/' OpenFOAM-2.4.0/etc/config/CGAL.sh

# getting the number of available processors
export NUM_CPUS=$(cat /proc/cpuinfo | grep processor | wc -l | xargs)
source $HOME/OpenFOAM/OpenFOAM-2.4.0/etc/bashrc WM_NCOMPPROCS=$NUM_CPUS

# adding to .bashrc
echo "source \$HOME/OpenFOAM/OpenFOAM-2.4.0/etc/bashrc \$FOAM_SETTINGS" >> $HOME/.bashrc

# building OpenFOAM 
cd $WM_PROJECT_DIR
 
# change how the flex version is checked
find src applications -name "*.L" -type f | xargs sed -i -e 's=\(YY\_FLEX\_SUBMINOR\_VERSION\)=YY_FLEX_MINOR_VERSION < 6 \&\& \1='

mkdir -p $CGAL_ARCH_PATH
mkdir -p $BOOST_ARCH_PATH

cd $WM_PROJECT_DIR
 
# to be certain that the correct Qt version is being used
export QT_SELECT=qt4
 
# This next command will take a while... somewhere between 30 minutes to 3-6 hours.
./Allwmake > log.make 2>&1
 
# run it a second time for getting a summary of the installation
./Allwmake > log.make 2>&1