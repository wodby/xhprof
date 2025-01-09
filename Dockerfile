ARG BASE_IMAGE_TAG

FROM wodby/php:${BASE_IMAGE_TAG}

ARG XHPROF_VER

ENV XHPROF_VER="${XHPROF_VER}" \
    # override to enable xhprof extension.
    PHP_EXTENSIONS_DISABLE='xdebug,spx' \
    PHP_XHPROF_OUTPUT_DIR='/mnt/files/xhprof'

USER root

RUN set -ex; \
    \
    apk add --update \
        font-bitstream-type1 \
        ghostscript-fonts \
        graphviz; \
    \
    wget -nv "https://github.com/longxinH/xhprof/archive/v${XHPROF_VER}.zip" -O /tmp/xhprof.zip; \
    unzip /tmp/xhprof.zip -d /tmp; \
    mv /tmp/xhprof-* /tmp/xhprof; \
    mv /tmp/xhprof/xhprof_html /var/www/html/; \
    mv /tmp/xhprof/xhprof_lib /var/www/html/; \
    chown -R wodby:wodby /var/www/html/*; \
    chmod -R 755 /var/www/html/*; \
    \
    rm -rf /tmp/*; \
    chmod o+w /var/cache/fontconfig

USER wodby

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html/xhprof_html"]