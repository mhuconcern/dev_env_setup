#!/bin/bash

set -exo pipefail

apt-get update 
apt-get install git 
source ~/.bashrc

cd ~
git clone git@github.com:LEMOS-Rostock/LEMOS-2.4.x.git
mv ./LEMOS-2.4.x $FOAM_SRC
echo "source \$FOAM_SRC/LEMOS-2.4.x/bashrc"
source ~/.bashrc

./applyPatches
$LEMOSEXT/Allwmake


