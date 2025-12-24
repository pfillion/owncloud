ARG CURRENT_VERSION_MICRO=latest

FROM owncloud/server:$CURRENT_VERSION_MICRO

# Build-time metadata as defined at https://github.com/opencontainers/image-spec
ARG DATE
ARG CURRENT_VERSION_MICRO
ARG COMMIT
ARG AUTHOR

LABEL \
    org.opencontainers.image.created=$DATE \
    org.opencontainers.image.url="https://hub.docker.com/r/pfillion/owncloud" \
    org.opencontainers.image.source="https://github.com/pfillion/owncloud" \
    org.opencontainers.image.version=$CURRENT_VERSION_MICRO \
    org.opencontainers.image.revision=$COMMIT \
    org.opencontainers.image.vendor="pfillion" \
    org.opencontainers.image.title="owncloud" \
    org.opencontainers.image.description="Docker image for ownCloud community edition" \
    org.opencontainers.image.authors=$AUTHOR \
    org.opencontainers.image.licenses="MIT"

COPY --chmod=0755 rootfs /