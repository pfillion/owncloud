# ownCloud

[![Build Status](https://drone.pfillion.com/api/badges/pfillion/owncloud/status.svg?branch=master)](https://drone.pfillion.com/pfillion/owncloud)
[![microbadger image](https://images.microbadger.com/badges/image/pfillion/owncloud.svg)](https://microbadger.com/images/pfillion/owncloud "Get your own image badge on microbadger.com")
[![microbadger image](https://images.microbadger.com/badges/version/pfillion/owncloud.svg)](https://microbadger.com/images/pfillion/owncloud "Get your own version badge on microbadger.com")
[![microbadger image](https://images.microbadger.com/badges/commit/pfillion/owncloud.svg)](https://microbadger.com/images/pfillion/owncloud "Get your own commit badge on microbadger.com")

These are docker images for [ownCloud](https://owncloud.org) community edition. Mainly, it's to manage [healthcheck](https://docs.docker.com/engine/reference/builder/#healthcheck) with credential specified by **secrets**.

The base image is from official [ownCloud](https://hub.docker.com/r/owncloud/server).

## Versions

* [latest](https://github.com/pfillion/owncloud/tree/master) available as ```pfillion/owncloud:latest``` at [Docker Hub](https://hub.docker.com/r/pfillion/owncloud/)
* [10.0.10](https://github.com/pfillion/owncloud/tree/master) available as ```pfillion/owncloud:10.0.10``` at [Docker Hub](https://hub.docker.com/r/pfillion/owncloud/)

## Volumes

TODO: remove cron.d every minute for cronjob in the docker image OR order soluton. It raise error of login witjhout password every minute.

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