#!/bin/bash

set -exo pipefail

# getting the LEMOS files inside the docker
apt-get update && apt-get install -y unzip libgsl0-dev libgsl0ldbl
unzip -q LEMOS-2.4.x-master.zip
rm -rf LEMOS-2.4.x-master.zip
mv LEMOS-2.4.x-master LEMOS-2.4.x

cd ~
mv ./LEMOS-2.4.x $FOAM_SRC/
echo "source \$FOAM_SRC/LEMOS-2.4.x/bashrc" >> $HOME/.bashrc
source ~/.bashrc

cd $FOAM_SRC/LEMOS-2.4.x
chmod a+x ./applyPatches ./Allwmake
$LEMOSEXT/applyPatches
$LEMOSEXT/Allwmake
