# Only need to change these two variables
PKG_NAME=freepascal

OS=$TRAVIS_OS_NAME-64
mkdir ~/conda-bld
conda config --set anaconda_upload no
export CONDA_BLD_PATH=~/conda-bld
conda build $PKG_NAME
anaconda -t $CONDA_UPLOAD_TOKEN upload $CONDA_BLD_PATH/$OS/$PKG_NAME-*.tar.bz2 --force
