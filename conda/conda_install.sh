#!/usr/bin/env bash

set -ev # exit on first error, print each command

if [ ${PYTHON_ARCH} == "32" ]; then
  set CONDA_FORCE_32BIT=1
fi
conda create -q -n freepascal-build-environment python=$PYTHON_VERSION
source activate freepascal-build-environment
conda info -a
conda list

