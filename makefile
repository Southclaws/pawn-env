# -
# Setup test requirements
# -

test-setup:
	cd test && sampctl server ensure
	sampctl package ensure

# -
# Run Tests
# -

test-windows:
	sampctl package build
	cd test && SAMP_ENV_TEST="hello world" sampctl server run

test-linux:
	sampctl package build
	docker run \
		-e SAMP_ENV_TEST="hello world" \
		-v "/$(shell pwd)/test:/samp" \
		southclaws/sampctl:1.8.11 \
		server run

# -
# Build (Linux)
# -

build-linux:
	rm -rf build
	docker build -t southclaws/env-build .
	docker run -v $(shell pwd)/test/plugins:/root/test/plugins southclaws/env-build

build-inside:
	cd build && cmake .. && make
