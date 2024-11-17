
ARG BASE_IMAGE=alpine
ARG BASE_VERSION=3.20.3

FROM ${BASE_IMAGE}:${BASE_VERSION} as IMAGE_ROOTFS

ENV ROOTFS_PATH="/rootfs"

ENV MIRROR_LINK="http://mirror.hyperdedic.ru/alpinelinux/"
ENV MIRROR_VERSION="3.20"

RUN apk add --no-cache bash

RUN mkdir -p "$ROOTFS_PATH/etc/apk"
RUN echo "$MIRROR_LINK/$MIRROR_VERSION/main"; echo "$MIRROR_LINK/$MIRROR_VERSION/community"

FROM scratch

COPY --from=IMAGE_ROOTFS /rootfs/ /