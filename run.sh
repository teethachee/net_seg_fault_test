#!/bin/bash

cd $(dirname $0)

net_ver=${1:-8.0}

case $net_ver in
    6.0|7.0|8.0)
        echo "Building for net$net_ver"
        ;;
    *)
        echo "Invalid .NET version: $net_ver"
        exit 1
        ;;
esac

docker build . \
    --build-arg NET_VERSION=${net_ver} \
    --target runtime \
    --tag "segv_test:$net_ver"

echo ""
echo "Running segv_test w/o installing glog signal handler"
docker run "segv_test:$net_ver"
echo "Exit code: $?"

echo ""
echo ""
echo "Running segv_test w/ installing glog signal handler"
docker run -e INSTALL_FAILURE_HANDLER="1" "segv_test:$net_ver"
echo "Exit code: $?"
