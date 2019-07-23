FROM wordpress:fpm-alpine

RUN apk add --no-cache s6 nginx mariadb-client

ADD rootfs /
RUN mkdir /run/nginx && chown -R www-data /etc/services.d/ /var/lib/nginx /var/log/nginx /var/tmp/nginx /run/nginx

EXPOSE 8080

User www-data

ENTRYPOINT ["s6-svscan", "/etc/services.d"]
