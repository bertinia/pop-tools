#!/bin/bash

set -e
set -eo pipefail

apt-get update && apt-get install subversion git -y

conda config --set always_yes true --set changeps1 false --set quiet true
conda config --add channels conda-forge
conda env create -f ci/environment-dev-${PYTHON}.yml --name=${ENV_NAME} --quiet
conda env list
source activate ${ENV_NAME}
pip install --no-deps --quiet -e .
conda list -n ${ENV_NAME}
