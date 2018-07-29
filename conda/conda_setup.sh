#!/usr/bin/env bash

set -ev # exit on first error, print each command

MINICONDA_URL="http://repo.continuum.io/miniconda"

if [ ${PYTHON_VERSION:0:1} == "2" ]; then
    MINICONDA="Miniconda2"
else
    MINICONDA="Miniconda3"
fi
if [ ${TRAVIS_OS_NAME} == "osx" ]; then
    MINICONDA_OS="MacOSX"
else
    MINICONDA_OS="Linux"
fi
if [ ${PYTHON_ARCH} == "64" ]; then
    URL="${MINICONDA_URL}/${MINICONDA}-latest-${MINICONDA_OS}-x86_64.sh"
else
    URL="${MINICONDA_URL}/${MINICONDA}-latest-${MINICONDA_OS}-x86.sh"
fi
travis_retry wget "${URL}" -O miniconda.sh

if [ ${TRAVIS_OS_NAME} == "osx" ]; then
    echo ""
    echo "Removing homebrew from Travis CI to avoid conflicts."
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall > ~/uninstall_homebrew
    chmod +x ~/uninstall_homebrew
    ~/uninstall_homebrew -fq
    rm ~/uninstall_homebrew
fi

chmod +x miniconda.sh
./miniconda.sh -b -p "${HOME}/miniconda"
export PATH="${HOME}/miniconda/bin:${PATH}"
hash -r
conda config --set always_yes yes --set changeps1 no
conda update -q conda
