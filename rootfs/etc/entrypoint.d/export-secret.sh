#!/bin/bash
set -eo pipefail
shopt -s nullglob

source /usr/bin/secret-helper.sh

export_secret_from_env "OWNCLOUD_DB_NAME"
export_secret_from_env "OWNCLOUD_DB_USERNAME"
export_secret_from_env "OWNCLOUD_DB_PASSWORD"
export_secret_from_env "OWNCLOUD_ADMIN_USERNAME"
export_secret_from_env "OWNCLOUD_ADMIN_PASSWORD"