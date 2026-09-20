# XHProf traces viewer

[![Build Status](https://github.com/wodby/xhprof/workflows/Build%20docker%20image/badge.svg)](https://github.com/wodby/xhprof/actions)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/xhprof.svg)](https://hub.docker.com/r/wodby/xhprof)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/xhprof.svg)](https://hub.docker.com/r/wodby/xhprof)

## Docker Images

Use image revision tags such as `wodby/xhprof:rN` to select a Wodby image revision.
The `rN` suffix identifies the image revision separately from the upstream software version.
See [release tags](https://github.com/wodby/xhprof/tags) for available revisions and the [image revision policy](https://github.com/wodby/images#image-revisions) for upgrade guidance.
Existing SemVer image tags remain available.

Overview:

- All images based on Alpine Linux
- Base image: [wodby/php](https://github.com/wodby/php)
- [GitHub actions builds](https://github.com/wodby/xhprof/actions) 
- [Docker Hub](https://hub.docker.com/r/wodby/xhprof)

Supported tags and respective `Dockerfile` links:

- `2.3`, `2`, `latest` [_(Dockerfile)_](https://github.com/wodby/xhprof/tree/master/Dockerfile)

All images built for `linux/amd64` and `linux/arm64`

## Environment variables

| Variable                | Default Value       | Description                      |
|-------------------------|---------------------|----------------------------------|
| `PHP_XHPROF_OUTPUT_DIR` | `/mnt/files/xhprof` | Output directory for xhprof runs |

See all xhprof extension env vars at https://github.com/wodby/php/blob/master/8/templates/docker-php-ext-xhprof.ini.tmpl
