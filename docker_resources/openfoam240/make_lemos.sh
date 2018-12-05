#!/bin/bash

set -exo pipefail

# getting the LEMOS files inside the docker
apt-get update
apt-get install -y unzip libgsl0-dev gsl-ref-psdoc gsl-doc-pdf gsl-doc-info gsl-ref-html
#libgsl0ldbl

unzip -q LEMOS-2.4.x-master.zip
rm -f *.zip
mv LEMOS-2.4.x-master LEMOS-2.4.x

echo "source \$FOAM_SRC/LEMOS-2.4.x/bashrc" >> $HOME/.bashrc
source ~/.bashrc

mv ./LEMOS-2.4.x $FOAM_SRC/
cd $FOAM_SRC/LEMOS-2.4.x
chmod a+x ./applyPatches ./Allwmake
./applyPatches
./Allwmake
