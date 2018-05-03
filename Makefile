#
# Makefile
# Paco Esteban, 2018-05-03
#

BINARY=freegeoip

.DEFAULT: build

build:
	mkdir -p ./build
	cd ./cmd/freegeoip && \
		GOOS=linux GOARCH=amd64 CGO_ENABLED=0 \
		go build ${LDFLAGS} -o \
		../../build/${BINARY}

sign:
	@echo "singing in the rain"
	cd ./build && \
		sha256sum * > SHA256 && \
		gpg --armor --detach-sign SHA256

clean:
	rm -rf ./build/*

.PHONY: clean build sign

# vim:ft=make
#
