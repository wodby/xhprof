ARG BASE_IMAGE_TAG

FROM wodby/php:${BASE_IMAGE_TAG}

ARG XHPROF_VER

ENV XHPROF_VER="${XHPROF_VER}" \
    PHP_XHPROF_OUTPUT_DIR='/mnt/files/private/xhprof'

USER root

COPY xhprof_runs.php.patch /var/www/html/

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
    patch -d /var/www/html/xhprof_lib/utils/ < /var/www/html/xhprof_runs.php.patch; \
    rm /var/www/html/xhprof_runs.php.patch; \
    \
    rm -rf /tmp/*

USER wodby

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html/xhprof_html"]