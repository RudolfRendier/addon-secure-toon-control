#!/usr/bin/with-contenv bash
# ==============================================================================
# Community Hass.io Add-ons: Pi-hole
# Configures NGINX for use with Pi-hole
# ==============================================================================
# shellcheck disable=SC1091
source /usr/lib/hassio-addons/base.sh

declare password
declare password_version
declare toon_ip
declare toon_version

password=$(hass.config.get 'password')
#password_version=$(hass.config.get 'password_version')
password_version=2
toon_ip=$(hass.config.get 'toon_ip')
toon_version=$(hass.config.get 'toon_version')

sed -i "s/'%%password%%'/'${password}'/g" /var/www/html/php/api.php
sed -i "s/%%password_version%%/${password_version}/g" /var/www/html/php/api.php
sed -i "s/%%password_version%%/${password_version}/g" /var/www/html/index.php
sed -i "s/'%%toon_ip%%'/'${toon_ip}'/g" /var/www/html/php/api.php
sed -i "s/'%%toon_version%%'/'${toon_version}'/g" /var/www/html/php/api.php
