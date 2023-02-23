ROOT=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))
PYTHON_VERSION="3"
ARCH="amd64"

build:
	# create build environment
	docker build \
		-t ${ARCH}/dt_vl53l0x:wheel-python${$PYTHON_VERSION} \
		--build-arg ARCH="${ARCH}" \
		--build-arg PYTHON_VERSION="${PYTHON_VERSION}" \
		${ROOT}
	# create wheel destination directory
	mkdir -p ${ROOT}/dist
	# build wheel
	docker run \
		-it --rm \
		-v ${ROOT}:/source \
		-v ${ROOT}/dist:/out \
		${ARCH}/dt_vl53l0x:wheel-python${$PYTHON_VERSION}

upload:
	twine upload ${ROOT}/dist/*

clean:
	rm -rf ${ROOT}/dist/*

release-all:
	# amd64
	make build
	# arm32v7
	make build ARCH=arm32v7
	# arm64v8
	make build ARCH=arm64v8
	# push wheels
	make upload