# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:f3fdaa01d0cfa26cb0af57d444bb75424b93da7d6fab90da273e8ff4b4f88aeb
BASE_IMAGE_DIGEST_8.2-r11 := sha256:969a081bf3f0bca190336b06507928080854fdaa378bbebbe05ac6bfe25c9bf0

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
