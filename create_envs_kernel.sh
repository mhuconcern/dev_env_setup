#!/bin/bash

YML="$HOME/Desktop/req.yml"
ENV_NAME="ml_tr"

# building the environment
conda env create -f $YML

# making the corresponding kernel for use in the notebooks
source activate $ENV_NAME

python -m ipykernel install --user --name $ENV_NAME --display-name $ENV_NAME

