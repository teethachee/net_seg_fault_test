#!/bin/bash

set -e

cd $(dirname $0)

net_ver=${NET_TargetFramework:-net8.0}
case $net_ver in
    net6.0|net7.0|net8.0)
        echo "Building for $net_ver"
        ;;
    *)
        echo "Invalid .NET version: $net_ver"
        exit 1
        ;;
esac

out_dir=${1:-out}

which cmake

rm -rf build
mkdir build
pushd $_

cmake ..
cmake --build . --target foo -j$(nproc)
popd

pushd app
dotnet publish -c Release -o "$out_dir"
popd
