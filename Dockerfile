# syntax=docker/dockerfile:1

ARG NET_VERSION=8.0
FROM mcr.microsoft.com/dotnet/sdk:${NET_VERSION} AS builder

ENV DEBIAN_FRONTEND=noninteractive

RUN --mount=type=cache,target=/var/cache/apt --mount=type=cache,target=/var/lib/apt \
    apt-get update;

RUN --mount=type=cache,target=/var/cache/apt --mount=type=cache,target=/var/lib/apt \
    apt-get install -y --no-install-recommends \
        wget curl build-essential cmake time vim nano

ARG NET_VERSION
ENV NET_TargetFramework="net${NET_VERSION}"
RUN --mount=target=/mnt/src \
    cp -R /mnt/src /tmp/build && \
    /tmp/build/build.sh /opt/seg_fault_test

FROM mcr.microsoft.com/dotnet/runtime:${NET_VERSION} AS runtime

RUN --mount=from=builder,target=/mnt/builder \
    cp -R /mnt/builder/opt/seg_fault_test /opt/seg_fault_test

ENTRYPOINT ["dotnet", "/opt/seg_fault_test/console.dll"]
