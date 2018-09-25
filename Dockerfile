ARG BUILD_FROM=hassioaddons/base:2.3.0
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
# hadolint ignore=DL3003
RUN \
    apk add --no-cache \
        bash=4.4.19-r1 \
        git=2.18.0-r0 \
        nginx=1.14.0-r1 \
        openssl=1.0.2o-r2 \
        perl=5.26.2-r1 \
        php7-fileinfo=7.2.10-r0 \
        php7-fpm=7.2.10-r0 \
        php7-json=7.2.10-r0 \
        php7-opcache=7.2.10-r0 \
        php7-openssl=7.2.10-r0 \
        php7-phar=7.2.10-r0 \
        php7-session=7.2.10-r0 \
        php7-sockets=7.2.10-r0 \
        php7-sqlite3=7.2.10-r0 \
        php7-zip=7.2.10-r0 \
        sed=4.4-r2 \
    \
    && addgroup -S toon \
    && adduser -S -s /sbin/nologin toon toon \
    && addgroup toon nginx

# Copy root filesystem
COPY rootfs /

# Build arugments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

WORKDIR /var/www/html
RUN git clone --branch power-support --depth=1 \
        https://github.com/RudolfRendier/secure-toon-control.git .

# Labels
LABEL \
    io.hass.name="Secure-Toon-Control" \
    io.hass.description="Simple webinterface for Toon Thermostat" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Franck Nijhof <frenck@addons.community>" \
    org.label-schema.description="Simple webinterface for Toon Thermostat" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="Secure-Toon-Control" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://community.home-assistant.io/t/community-hass-io-add-on-secure-toon-control" \
    org.label-schema.usage="https://github.com/hassio-addons/addon-pi-hole/tree/master/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/hassio-addons/addon-secure-toon-control" \
    org.label-schema.vendor="Community Hass.io Addons"
