FROM docker-dev1-local.chip-repo.childrens.harvard.edu/ihlchip/alpine-s6:3.5.1
MAINTAINER Stanley Boykin <smboykin@gmail.com>

RUN apk --update add mariadb mariadb-client pwgen && \
    rm -f /var/cache/apk/*

# ADD files/run.sh /scripts/run.sh
ADD files/run.sh /etc/services.d/mariadb/run
RUN mkdir -p /scripts/pre-exec.d && \
    mkdir /scripts/pre-init.d && \
    chmod -R 755 /scripts

EXPOSE 3306

VOLUME ["/var/lib/mysql"]

# ENTRYPOINT ["/scripts/run.sh"]
