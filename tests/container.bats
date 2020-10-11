#!/usr/bin/env bats

NS=${NS:-pfillion}
IMAGE_NAME=${IMAGE_NAME:-owncloud}
VERSION=${VERSION:-latest}
CONTAINER_NAME="owncloud-${VERSION}"

load 'test_helper/bats-support/load'
load 'test_helper/bats-assert/load'

# Retry a command $1 times until it succeeds. Wait $2 seconds between retries.
function retry(){
	local attempts=$1
	shift
	local delay=$1
	shift
	local i

	for ((i=0; i < attempts; i++)); do
		run "$@"
		if [[ "$status" -eq 0 ]]; then
			return 0
		fi
		sleep $delay
	done

	echo "Command \"$@\" failed $attempts times. Output: $output"
	false
}

function is_ready(){
	docker logs ${CONTAINER_NAME} 2>&1 | tr "\n" " " | grep "Starting apache daemon...*/usr/sbin/apache2"
}

function teardown(){
    docker rm -f ${CONTAINER_NAME}
}

@test "entrypoint.d-export-secret" {
    docker run -d --name ${CONTAINER_NAME} ${NS}/${IMAGE_NAME}:${VERSION}
    retry 30 1 is_ready
    
    # Test all environment variables supported by secret files.
	docker exec ${CONTAINER_NAME} bash -c "echo 'secret1' > /file1"
	docker exec ${CONTAINER_NAME} bash -c "echo 'secret2' > /file2"
	docker exec ${CONTAINER_NAME} bash -c "echo 'secret3' > /file3"
	docker exec ${CONTAINER_NAME} bash -c "echo 'secret4' > /file4"
	docker exec ${CONTAINER_NAME} bash -c "echo 'secret5' > /file5"
    
	run docker exec \
		-e 'OWNCLOUD_DB_NAME_FILE=/file1' \
		-e 'OWNCLOUD_DB_USERNAME_FILE=/file2' \
		-e 'OWNCLOUD_DB_PASSWORD_FILE=/file3' \
		-e 'OWNCLOUD_ADMIN_USERNAME_FILE=/file4' \
		-e 'OWNCLOUD_ADMIN_PASSWORD_FILE=/file5' \
		${CONTAINER_NAME} \
		bash -c '. /etc/entrypoint.d/export-secret.sh && 
			echo $OWNCLOUD_DB_NAME && 
			echo $OWNCLOUD_DB_USERNAME &&
			echo $OWNCLOUD_DB_PASSWORD &&
			echo $OWNCLOUD_ADMIN_USERNAME &&
			echo $OWNCLOUD_ADMIN_PASSWORD'
	
	assert_success
	assert_line --index 0 'secret1'
	assert_line --index 1 'secret2'
	assert_line --index 2 'secret3'
	assert_line --index 3 'secret4'
	assert_line --index 4 'secret5'
}

@test "pre_cronjob.d-export-secret" {
    docker run -d --name ${CONTAINER_NAME} ${NS}/${IMAGE_NAME}:${VERSION}
    retry 30 1 is_ready
    
    # Test all environment variables supported by secret files.
	docker exec ${CONTAINER_NAME} bash -c "echo 'secret1' > /file1"
	docker exec ${CONTAINER_NAME} bash -c "echo 'secret2' > /file2"
	docker exec ${CONTAINER_NAME} bash -c "echo 'secret3' > /file3"
	docker exec ${CONTAINER_NAME} bash -c "echo 'secret4' > /file4"
	docker exec ${CONTAINER_NAME} bash -c "echo 'secret5' > /file5"
    
	run docker exec \
		-e 'OWNCLOUD_DB_NAME_FILE=/file1' \
		-e 'OWNCLOUD_DB_USERNAME_FILE=/file2' \
		-e 'OWNCLOUD_DB_PASSWORD_FILE=/file3' \
		-e 'OWNCLOUD_ADMIN_USERNAME_FILE=/file4' \
		-e 'OWNCLOUD_ADMIN_PASSWORD_FILE=/file5' \
		${CONTAINER_NAME} \
		bash -c '. /etc/pre_cronjob.d/export-secret.sh && 
			echo $OWNCLOUD_DB_NAME && 
			echo $OWNCLOUD_DB_USERNAME &&
			echo $OWNCLOUD_DB_PASSWORD &&
			echo $OWNCLOUD_ADMIN_USERNAME &&
			echo $OWNCLOUD_ADMIN_PASSWORD'
	
	assert_success
	assert_line --index 0 'secret1'
	assert_line --index 1 'secret2'
	assert_line --index 2 'secret3'
	assert_line --index 3 'secret4'
	assert_line --index 4 'secret5'
}