#!/bin/bash

set -e
set -x

echo $pwd

# function download(url, output)
function download() {
    if type "curl" > /dev/null; then
        curl -o "$1" "$2"
    elif type "wget" > /dev/null; then
        wget -O "$1" "$2"
    fi
}

if [ `uname` = "Darwin" ]; then

    wget https://downloads.sourceforge.net/project/freepascal/Bootstrap/3.0.0/x86_64-macosx-10.7-ppcx64.tar.bz2
    tar -xf x86_64-macosx-10.7-ppcx64.tar.bz2
    mkdir -p fpc_bootstrap
    mv ./ppcx64 ./fpc_bootstrap/ppc

else

    # Determine operating system architecture
    CPU=$(uname -m)

    if [ "$CPU" = "i686" ]; then
        CPU="i386"
    fi

    if [ "$CPU" = "i386" ]; then

        wget https://downloads.sourceforge.net/project/freepascal/Bootstrap/2.6.4/i386-freebsd9-ppc386.bz2
        bzip2 -d i386-freebsd9-ppc386.bz2
        mkdir -p fpc_bootstrap
        mv ./i386-freebsd9-ppc386 ./fpc_bootstrap/ppc

    else

        wget https://downloads.sourceforge.net/project/freepascal/Bootstrap/2.6.4/x86_64-freebsd9-ppcx64.bz2
        bzip2 -d x86_64-freebsd9-ppcx64.bz2
        mkdir -p fpc_bootstrap
        mv ./x86_64-freebsd9-ppcx64 ./fpc_bootstrap/ppc

    fi

fi

export FPC_COMPILER="$(pwd)/fpc_bootstrap/ppc"

make build PP=${FPC_COMPILER} > /dev/null 2>&1
make install PP=${FPC_COMPILER} PREFIX=${PREFIX} > /dev/null 2>&1

