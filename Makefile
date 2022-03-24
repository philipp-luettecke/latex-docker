NS = philipp-luettecke
REPO = latex
IMAGE = $(NS)/$(REPO)

.PHONY: build build_ubuntu build_basic build_full

build: build_ubuntu build_basic build_full

build_ubuntu: Dockerfile.ubuntu
	@docker build -f Dockerfile.ubuntu -t $(IMAGE)-ubuntu .

build_basic: Dockerfile.basic
	@docker build -f Dockerfile.basic -t $(IMAGE)-ctanbasic:2021 .

build_full: build_basic Dockerfile.full
	@docker build -f Dockerfile.full -t $(IMAGE)-ctanfull:2021 .

default: build
