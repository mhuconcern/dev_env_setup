#!/bin/bash

set -exo pipefail

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

