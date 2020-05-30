CONSUL_VERSION=1.8.0-beta2
IMAGE=consul-ingress-gateway:${CONSUL_VERSION}

.PHONY: build
build:
	docker build \
	--build-arg CONSUL_VERSION=${CONSUL_VERSION} \
	-t ${IMAGE} .
.PHONY: test
test:
	/bin/sh test
.PHONY: release
release:
	docker tag ${IMAGE} daneharrigan/${IMAGE}
	docker push daneharrigan/${IMAGE}
