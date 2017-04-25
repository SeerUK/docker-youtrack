FROM java:8-alpine
MAINTAINER Elliot Wright <hello@elliotdwright.com>

ARG YOUTRACK_VERSION="2017.2.32582"

ENV YOUTRACK_MMS=256M
ENV YOUTRACK_PORT=8080
ENV YOUTRACK_XMX=1G

ADD docker-command.sh /opt/youtrack/docker-command.sh

RUN set -x \
    && apk update \
    && apk add wget \
    && rm -rf /var/cache/apk/* \
    && adduser -h /opt/youtrack -D -u 1000 youtrack \
    && mkdir -p /opt/youtrack \
    && mkdir -p /opt/youtrack/backup \
    && mkdir -p /opt/youtrack/data \
    && cd /opt/youtrack \
    && wget https://download-cf.jetbrains.com/charisma/youtrack-${YOUTRACK_VERSION}.jar \
    && mv youtrack-${YOUTRACK_VERSION}.jar youtrack.jar \
    && chown -R youtrack: /opt/youtrack \
    && chmod +x /opt/youtrack/docker-command.sh

USER youtrack

EXPOSE 8080

WORKDIR /opt/youtrack

CMD ["/opt/youtrack/docker-command.sh"]
