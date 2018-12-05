#!/bin/bash

set -exo pipefail

# apt-get update \
#     && apt-get install -yq curl make vim nano \
#     && apt-get install -yq git-core build-essential cmake flex bison zlib1g-dev qt4-dev-tools libqt4-dev libqtwebkit-dev gnuplot \
#     libreadline-dev libncurses5-dev libxt-dev libopenmpi-dev openmpi-bin libboost-system-dev libboost-thread-dev libgmp-dev \
#     libmpfr-dev python python-dev libcgal-dev unzip libglu1-mesa-dev libqt4-opengl-dev libgsl-dev

# getting the LEMOS files inside the docker
unzip -q LEMOS-2.4.x-master.zip
rm -f *.zip
mv LEMOS-2.4.x-master LEMOS-2.4.x

source ~/.bashrc
mv ./LEMOS-2.4.x $FOAM_SRC/
echo "source \$FOAM_SRC/LEMOS-2.4.x/bashrc" >> $HOME/.bashrc
source ~/.bashrc

cd $FOAM_SRC/LEMOS-2.4.x
chmod a+x ./applyPatches ./Allwmake
./applyPatches
./Allwmake

