# Community Hass.io Add-ons: Secure Toon Control

[![GitHub Release][releases-shield]][releases]
![Project Stage][project-stage-shield]
[![License][license-shield]](LICENSE.md)

[![GitLab CI][gitlabci-shield]][gitlabci]
![Project Maintenance][maintenance-shield]
[![GitHub Activity][commits-shield]][commits]

[![Bountysource][bountysource-shield]][bountysource]
[![Discord][discord-shield]][discord]
[![Community Forum][forum-shield]][forum]

[![Buy me a coffee][buymeacoffee-shield]][buymeacoffee]

[![Support my work on Patreon][patreon-shield]][patreon]

Network-wide ad blocking using your Hass.io instance

## About

[Secure Toon Control][Secure Toon Control] is a simple webbased UI allowing control of Rooted Toon Thermostats.

This add-on is a modification of addon-pi-hole to be able to run on Hass.io and is based on
Alpine Linux and is using Docker.

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Hass.io add-on.

1. [Add our Hass.io add-ons repository][repository] to your Hass.io instance.
1. Install the "Secure-Toon-Control" add-on
1. Configure the add-on by setting a strong password, declaring your Toon version (4.8 or 4.9+), and setting it IP.
1. Start the "Secure-Toon-Control" add-on
1. Check the logs of the "Secure-Toon-Control" add-on to see it in action.

**NOTE**: Do not add this repository to Hass.io, please use:
`https://github.com/hassio-addons/repository`.

## Docker status

[![Docker Architecture][armhf-arch-shield]][armhf-dockerhub]
[![Docker Version][armhf-version-shield]][armhf-microbadger]
[![Docker Layers][armhf-layers-shield]][armhf-microbadger]
[![Docker Pulls][armhf-pulls-shield]][armhf-dockerhub]
[![Anchore Image Overview][armhf-anchore-shield]][armhf-anchore]

[![Docker Architecture][aarch64-arch-shield]][aarch64-dockerhub]
[![Docker Version][aarch64-version-shield]][aarch64-microbadger]
[![Docker Layers][aarch64-layers-shield]][aarch64-microbadger]
[![Docker Pulls][aarch64-pulls-shield]][aarch64-dockerhub]
[![Anchore Image Overview][aarch64-anchore-shield]][aarch64-anchore]

[![Docker Architecture][amd64-arch-shield]][amd64-dockerhub]
[![Docker Version][amd64-version-shield]][amd64-microbadger]
[![Docker Layers][amd64-layers-shield]][amd64-microbadger]
[![Docker Pulls][amd64-pulls-shield]][amd64-dockerhub]
[![Anchore Image Overview][amd64-anchore-shield]][amd64-anchore]

[![Docker Architecture][i386-arch-shield]][i386-dockerhub]
[![Docker Version][i386-version-shield]][i386-microbadger]
[![Docker Layers][i386-layers-shield]][i386-microbadger]
[![Docker Pulls][i386-pulls-shield]][i386-dockerhub]
[![Anchore Image Overview][i386-anchore-shield]][i386-anchore]

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```json
{
    "log_level": "info",
    "password": "!secret secure_toon_control_password",
    "update_lists_on_start": false,
    "admin_port": 7272,
    "ssl": true,
    "certfile": "fullchain.pem",
    "keyfile": "privkey.pem",
    "toon_ip": "192.168.1.115",
    "toon_version": "4.9"
  }
```

**Note**: _This is just an example, don't copy and past it! Create your own!_

### Option: `log_level`

The `log_level` option controls the level of log output by the addon and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `warning`: Exceptional occurrences that are not errors.
- `error`:  Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. Add-on becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `debug` also shows `info` messages. By default,
the `log_level` is set to `info`, which is the recommended setting unless
you are troubleshooting.

### Option: `password`

Sets the password to authenticate with the web interface.

**Note**: _This option support secrets, e.g., `!secret secure_toon_control_password`._


### Option: `admin_port`

Changes the port on which the web interface will be served from.

### Option: `ssl`

Enables/Disables SSL (HTTPS) on the web interface. Set it `true` to
enable it, `false` otherwise.

### Option: `certfile`

The certificate file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is default for Hass.io_

### Option: `keyfile`

The private key file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is default for Hass.io_

### Option: `i_like_to_be_pwned`

Adding this option to the add-on configuration allows to you bypass the
HaveIBeenPwned password requirement by setting it to `true`.

**Note**: _We STRONGLY suggest picking a stronger/safer password instead of
using this option! USE AT YOUR OWN RISK!_

### Option: `leave_front_door_open`

Adding this option to the add-on configuration allows you to disable
authentication on the admin interface by setting it to `true` and leaving the
password empty.

**Note**: _We STRONGLY suggest, not to use this, even if this add-on is
only exposed to your internal network. USE AT YOUR OWN RISK!_

## Embedding into Home Assistant

It is possible to embed the Pi-hole admin directly into Home Assistant, allowing
you to access your Pi-hole admin through the Home Assistant frontend.

Home Assistant provides the `panel_iframe` component, for these purposes.

Example configuration:

```yaml
panel_iframe:
  pihole:
    title: Secure Toon Control
    icon: mdi:block-helper
    url: https://addres.to.your.hass.io:7272
```

## Changelog & Releases

This repository keeps a change log using [GitHub's releases][releases]
functionality. The format of the log is based on
[Keep a Changelog][keepchangelog].

Releases are based on [Semantic Versioning][semver], and use the format
of ``MAJOR.MINOR.PATCH``. In a nutshell, the version will be incremented
based on the following:

- ``MAJOR``: Incompatible or major changes.
- ``MINOR``: Backwards-compatible new features and enhancements.
- ``PATCH``: Backwards-compatible bugfixes and package updates.

## Support

Got questions?

You have several options to get them answered:

- The [Community Hass.io Add-ons Discord chat server][discord] for add-on
  support and feature requests.
- The [Home Assistant Discord chat server][discord-ha] for general Home
  Assistant discussions and questions.
- The Home Assistant [Community Forum][forum].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

You could also [open an issue here][issue] GitHub.

## Contributing

This is an active open-source project. We are always open to people who want to
use the code or contribute to it.

We have set up a separate document containing our
[contribution guidelines](CONTRIBUTING.md).

Thank you for being involved! :heart_eyes:

## Authors & contributors

The original setup of this repository is by [Franck Nijhof][frenck].

For a full list of all authors and contributors,
check [the contributor's page][contributors].

## We have got some Hass.io add-ons for you

Want some more functionality to your Hass.io Home Assistant instance?

We have created multiple add-ons for Hass.io. For a full list, check out
our [GitHub Repository][repository].

## Trademark legal notice

This add-on is not created, developed, affiliated, supported, maintained
or endorsed by Toon or Eneco.

All product names, logos, brands, trademarks and registered trademarks are
property of their respective owners. All company, product, and service names
used are for identification purposes only.

Use of these names, logos, trademarks, and brands does not imply endorsement.

## License

MIT License

Copyright (c) 2018 Franck Nijhof

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[aarch64-anchore-shield]: https://anchore.io/service/badges/image/de783b97af7a547dcb4b50b0477de59bc95038ceb44e6eb504583b029e0af6e2
[aarch64-anchore]: https://anchore.io/image/dockerhub/hassioaddons%2Fpi-hole-aarch64%3Alatest
[aarch64-arch-shield]: https://img.shields.io/badge/architecture-aarch64-blue.svg
[aarch64-dockerhub]: https://hub.docker.com/r/hassioaddons/pi-hole-aarch64
[aarch64-layers-shield]: https://images.microbadger.com/badges/image/hassioaddons/pi-hole-aarch64.svg
[aarch64-microbadger]: https://microbadger.com/images/hassioaddons/pi-hole-aarch64
[aarch64-pulls-shield]: https://img.shields.io/docker/pulls/hassioaddons/pi-hole-aarch64.svg
[aarch64-version-shield]: https://images.microbadger.com/badges/version/hassioaddons/pi-hole-aarch64.svg
[amd64-anchore-shield]: https://anchore.io/service/badges/image/dd82bb66262799e5d6f15922125118d6cc1cee03344d2d78c9f8c242c88d5e8d
[amd64-anchore]: https://anchore.io/image/dockerhub/hassioaddons%2Fpi-hole-amd64%3Alatest
[amd64-arch-shield]: https://img.shields.io/badge/architecture-amd64-blue.svg
[amd64-dockerhub]: https://hub.docker.com/r/hassioaddons/pi-hole-amd64
[amd64-layers-shield]: https://images.microbadger.com/badges/image/hassioaddons/pi-hole-amd64.svg
[amd64-microbadger]: https://microbadger.com/images/hassioaddons/pi-hole-amd64
[amd64-pulls-shield]: https://img.shields.io/docker/pulls/hassioaddons/pi-hole-amd64.svg
[amd64-version-shield]: https://images.microbadger.com/badges/version/hassioaddons/pi-hole-amd64.svg
[armhf-anchore-shield]: https://anchore.io/service/badges/image/099b7696874fcb69c46aa9fbf1e1709801e01d1a9d777edf33b9558c7f4f7807
[armhf-anchore]: https://anchore.io/image/dockerhub/hassioaddons%2Fpi-hole-armhf%3Alatest
[armhf-arch-shield]: https://img.shields.io/badge/architecture-armhf-blue.svg
[armhf-dockerhub]: https://hub.docker.com/r/hassioaddons/pi-hole-armhf
[armhf-layers-shield]: https://images.microbadger.com/badges/image/hassioaddons/pi-hole-armhf.svg
[armhf-microbadger]: https://microbadger.com/images/hassioaddons/pi-hole-armhf
[armhf-pulls-shield]: https://img.shields.io/docker/pulls/hassioaddons/pi-hole-armhf.svg
[armhf-version-shield]: https://images.microbadger.com/badges/version/hassioaddons/pi-hole-armhf.svg
[bountysource-shield]: https://img.shields.io/bountysource/team/hassio-addons/activity.svg
[bountysource]: https://www.bountysource.com/teams/hassio-addons/issues
[buymeacoffee-shield]: https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg
[buymeacoffee]: https://www.buymeacoffee.com/frenck
[commits-shield]: https://img.shields.io/github/commit-activity/y/hassio-addons/addon-pi-hole.svg
[commits]: https://github.com/hassio-addons/addon-pi-hole/commits/master
[contributors]: https://github.com/hassio-addons/addon-pi-hole/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord-shield]: https://img.shields.io/discord/478094546522079232.svg
[discord]: https://discord.me/hassioaddons
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io/t/community-hass-io-add-on-pi-hole/33817?u=frenck
[frenck]: https://github.com/frenck
[gitlabci-shield]: https://gitlab.com/hassio-addons/addon-pi-hole/badges/master/pipeline.svg
[gitlabci]: https://gitlab.com/hassio-addons/addon-pi-hole/pipelines
[i386-anchore-shield]: https://anchore.io/service/badges/image/159ec0dbd53a8e7921340f2019ec50b107b984db5ecd4d0349fb20fb7c689dbc
[i386-anchore]: https://anchore.io/image/dockerhub/hassioaddons%2Fpi-hole-i386%3Alatest
[i386-arch-shield]: https://img.shields.io/badge/architecture-i386-blue.svg
[i386-dockerhub]: https://hub.docker.com/r/hassioaddons/pi-hole-i386
[i386-layers-shield]: https://images.microbadger.com/badges/image/hassioaddons/pi-hole-i386.svg
[i386-microbadger]: https://microbadger.com/images/hassioaddons/pi-hole-i386
[i386-pulls-shield]: https://img.shields.io/docker/pulls/hassioaddons/pi-hole-i386.svg
[i386-version-shield]: https://images.microbadger.com/badges/version/hassioaddons/pi-hole-i386.svg
[issue]: https://github.com/hassio-addons/addon-pi-hole/issues
[keepchangelog]: http://keepachangelog.com/en/1.0.0/
[license-shield]: https://img.shields.io/github/license/hassio-addons/addon-pi-hole.svg
[maintenance-shield]: https://img.shields.io/maintenance/yes/2018.svg
[patreon-shield]: https://www.frenck.nl/images/patreon.png
[patreon]: https://www.patreon.com/frenck
[pi-hole-sensor]: https://home-assistant.io/components/sensor.pi_hole/
[pi-hole]: https://pi-hole.net/
[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[reddit]: https://reddit.com/r/homeassistant
[releases-shield]: https://img.shields.io/github/release/hassio-addons/addon-pi-hole.svg
[releases]: https://github.com/hassio-addons/addon-pi-hole/releases
[repository]: https://github.com/hassio-addons/repository
[semver]: http://semver.org/spec/v2.0.0.html
# addon-secure-toon-control
