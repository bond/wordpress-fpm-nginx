FROM wordpress:php7.3-fpm
RUN apt update && apt install -y --no-install-recommends nginx-light s6 procps net-tools
ADD rootfs /
RUN useradd -u 101 php && mkdir /var/run/php && chown php /var/run/php

ENTRYPOINT ["s6-svscan", "/etc/services.d"]

#ENTRYPOINT ["entrypoint.sh"]

