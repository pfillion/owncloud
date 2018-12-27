ARG VERSION
FROM owncloud/server:latest

# Build-time metadata as defined at http://label-schema.org
ARG VERSION
ARG BUILD_DATE
ARG VCS_REF
LABEL \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="owncloud" \
    org.label-schema.description="Docker image for ownCloud community edition" \
    org.label-schema.url="https://hub.docker.com/r/pfillion/owncloud" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/pfillion/owncloud" \
    org.label-schema.vendor="pfillion" \
    org.label-schema.version=$VERSION \
    org.label-schema.schema-version="1.0"

COPY rootfs /