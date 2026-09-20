# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/php
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_8.2 := sha256:ae540d18f479ea173553573200fbfbf2dfc4e0bf63cfe57fc33f1923842d0eec
BASE_IMAGE_DIGEST_8.2-4.71.5 := sha256:19168bbadbca012c02bd8f2a250d2a17e3a673afd8345ac760bba1950855e0d2

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
