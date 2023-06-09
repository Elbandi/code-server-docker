# Base image, greatful to linuxserver
FROM ghcr.io/linuxserver/code-server:4.13.0

RUN set -eux; \
# installation
	apt-get update; \
	DEBIAN_FRONTEND=noninteractive apt-get full-upgrade -y; \
	DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
		docker.io \
		docker-compose \
		; \
	DEBIAN_FRONTEND=noninteractive apt-get remove --purge --auto-remove -y; \
	rm -rf /var/lib/apt/lists/*; \
# smoke test
	docker-compose -v

# add local files
COPY /root /
