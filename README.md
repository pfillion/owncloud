# ownCloud

[![Build Status](https://drone.pfillion.com/api/badges/pfillion/owncloud/status.svg?branch=master)](https://drone.pfillion.com/pfillion/owncloud)
![GitHub](https://img.shields.io/github/license/pfillion/owncloud)
[![GitHub last commit](https://img.shields.io/github/last-commit/pfillion/owncloud?logo=github)](https://github.com/pfillion/owncloud "GitHub projet")

[![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/pfillion/owncloud/latest?logo=docker)](https://hub.docker.com/r/pfillion/owncloud "Docker Hub Repository")
[![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/pfillion/owncloud/latest?logo=docker)](https://hub.docker.com/r/pfillion/owncloud "Docker Hub Repository")
[![MicroBadger Layers (tag)](https://img.shields.io/microbadger/layers/pfillion/owncloud/latest?logo=docker)](https://microbadger.com/images/pfillion/owncloud "Get your own commit badge on microbadger.com")

These are docker images for [ownCloud](https://owncloud.org) community edition. Mainly, it's to manage [healthcheck](https://docs.docker.com/engine/reference/builder/#healthcheck) with credential specified by **secrets**.

The base image is from official [ownCloud](https://hub.docker.com/r/owncloud/server).

## Versions

* [10.5.0](https://github.com/pfillion/owncloud/tree/master) available as ```pfillion/owncloud:10.5.0``` at [Docker Hub](https://hub.docker.com/r/pfillion/owncloud/)
* [10.4.1](https://github.com/pfillion/owncloud/tree/master) available as ```pfillion/owncloud:10.4.1``` at [Docker Hub](https://hub.docker.com/r/pfillion/owncloud/)
* [10.4.0](https://github.com/pfillion/owncloud/tree/master) available as ```pfillion/owncloud:10.4.0``` at [Docker Hub](https://hub.docker.com/r/pfillion/owncloud/)
* [10.0.10](https://github.com/pfillion/owncloud/tree/master) available as ```pfillion/owncloud:10.0.10``` at [Docker Hub](https://hub.docker.com/r/pfillion/owncloud/)

## Volumes

* /mnt/data

## Ports

* 8080

## Docker Secrets

As an alternative to passing sensitive information via environment variables, `_FILE` may be appended to the listed environment variables, causing the initialization script to load the values for those variables from files present in the container. In particular, this can be used to load passwords from Docker secrets stored in `/run/secrets/<secret_name>` files.

Currently, this is only supported for :

```bash
OWNCLOUD_DB_NAME
OWNCLOUD_DB_USERNAME
OWNCLOUD_DB_PASSWORD
OWNCLOUD_ADMIN_USERNAME
OWNCLOUD_ADMIN_PASSWORD
```

## Inherited environment variables

* [owncloud/base](https://github.com/owncloud-docker/base#available-environment-variables)
* [owncloud/php](https://github.com/owncloud-docker/php#available-environment-variables)
* [owncloud/ubuntu](https://github.com/owncloud-docker/ubuntu#available-environment-variables)

## Authors

* [pfillion](https://github.com/pfillion)

## License

MIT
