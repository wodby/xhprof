ARG BASE_IMAGE_TAG

FROM wodby/php:${BASE_IMAGE_TAG}

ENV XHPROF_COMMIT='0bbf2a2ac34f495e42aa852293fe0ed821659047'

USER root

COPY xhprof_runs.php.patch /var/www/html/

RUN set -ex; \
    \
    apk add --update \
        font-bitstream-type1=1.0.3-r0 \
        ghostscript-fonts=8.11-r1 \
        graphviz=2.40.1-r1; \
    \
    wget -nv https://github.com/phacility/xhprof/archive/"${XHPROF_COMMIT}".zip -O /tmp/xhprof.zip; \
    unzip /tmp/xhprof.zip -d /tmp; \
    mv /tmp/xhprof-"${XHPROF_COMMIT}" /tmp/xhprof; \
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