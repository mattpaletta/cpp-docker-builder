#!/bin/env bash
set -eou pipefail

command -v docker >/dev/null 2>&1 || { echo >&2 "I require docker but it's not installed.  Aborting."; exit 1; }

build_image() {
	img_name=$1
	dockerfile=$2

	if [[ -e ${dockerfile} ]]; then
		echo "Found DockerFile"
	else
		echo "Failed to find Dockerfile: ${dockerfile}"
		exit 1
	fi

	docker image build -t ${img_name} -f ${dockerfile} .
	docker tag cpp-build mattpaletta/${img_name}
	docker tag cpp-build mattpaletta/${img_name}:latest
	docker push mattpaletta/${img_name}
	docker push mattpaletta/${img_name}:latest
}

build_image cpp-build Build
build_image cpp-dev Dev
build_image cpp-server BuildServer
