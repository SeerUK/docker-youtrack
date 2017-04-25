#!/usr/bin/env sh

java \
    -Xmx${YOUTRACK_XMX} \
    -XX:MaxMetaspaceSize=${YOUTRACK_MMS} \
    -Duser.home=/opt/youtrack \
    -Ddatabase.backup.location=/opt/youtrack/backup \
    -Ddatabase.location=/opt/youtrack/data \
    -Djetbrains.youtrack.disableBrowser=true \
    -Djetbrains.youtrack.enableGuest=false \
    -Djava.awt.headless=true \
    -Djetbrains.youtrack.disableCheckForUpdate=true \
    -Djava.security.egd=/dev/urandom \
    -jar /opt/youtrack/youtrack.jar ${YOUTRACK_PORT}
