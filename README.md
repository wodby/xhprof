# XHProf traces viewer

[![Build Status](https://github.com/wodby/xhprof/workflows/Build%20docker%20image/badge.svg)](https://github.com/wodby/xhprof/actions)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/xhprof.svg)](https://hub.docker.com/r/wodby/xhprof)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/xhprof.svg)](https://hub.docker.com/r/wodby/xhprof)

## Docker Images

❗For better reliability we release images with stability tags (`wodby/xhprof:X.X.X`) which correspond to [git tags](https://github.com/wodby/xhprof/releases). We strongly recommend using images only with stability tags. 

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

## Building with pinned base images

Build with the Makefile to use the base image digests in `base-images.mk`. Local
builds and CI resolve the same version and variant to the same multi-platform
image. A version without a pin fails before the build starts.

When adding a supported base version or variant, add its image index digest to
`base-images.mk`. For a custom build, override `BASE_IMAGE` with a complete
`repository:tag@sha256:...` reference.
