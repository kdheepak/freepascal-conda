#!/bin/bash

set -e
set -x

echo $pwd

wget https://downloads.sourceforge.net/project/freepascal/Bootstrap/3.0.0/x86_64-macosx-10.7-ppcx64.tar.bz2
tar -xf x86_64-macosx-10.7-ppcx64.tar.bz2
mkdir -p fpc_bootstrap
mv ./ppcx64 ./fpc_bootstrap/ppcx64

export FPC_COMPILER="./fpc_bootstrap/ppcx64"

make build PP=${FPC_COMPILER}
make install PP=${FPC_COMPILER} PREFIX=${PREFIX}

