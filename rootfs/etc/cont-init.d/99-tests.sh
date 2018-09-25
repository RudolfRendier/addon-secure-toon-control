#!/usr/bin/with-contenv bash
# ==============================================================================
# Community Hass.io Add-ons: Pi-hole
# Some final checks before stuff is actually started
# ==============================================================================
# shellcheck disable=SC1091
source /usr/lib/hassio-addons/base.sh

hass.log.debug 'Testing if all configurations valid'
php-fpm7 -t
nginx -t
