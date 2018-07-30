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
    export FPC_COMPILER="$(pwd)/ppcx64"

else

    # Determine operating system architecture
    CPU=$(uname -m)

    if [ "$CPU" = "i686" ]; then
        CPU="i386"
    fi

    if [ "$CPU" = "i386" ]; then

        wget https://downloads.sourceforge.net/project/freepascal/Bootstrap/2.6.4/i386-freebsd11-ppc386.bz2
        bzip2 -d i386-freebsd11-ppc386.bz2
        mkdir -p fpc_bootstrap
        export FPC_COMPILER="$(pwd)/i386-freebsd11-ppc386"
        chmod +x "${FPC_COMPILER}"

    else

        wget https://downloads.sourceforge.net/project/freepascal/Linux/3.0.4/fpc-3.0.4.x86_64-linux.tar
        tar -xvf fpc-3.0.4.x86_64-linux.tar
        cd fpc-3.0.4.x86_64-linux
        echo "${PREFIX}" | ./install.sh
        cd ..

    fi

fi

ls -al

if [ `uname` = "Darwin" ]; then

    make build PP=${FPC_COMPILER} > /dev/null 2>&1
    make install PP=${FPC_COMPILER} PREFIX=${PREFIX} > /dev/null 2>&1

else

    echo "Installed to ${PREFIX}"

fi
