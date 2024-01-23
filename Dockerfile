FROM cm2network/steamcmd:root

LABEL org.opencontainers.image.authors="mindflay3r"
LABEL org.opencontainers.image.source="https://github.com/antisoft-club/palworld-container"

RUN apt-get update \
    && apt-get install -y --no-install-recommends procps xdg-user-dirs \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Latest releases available at https://github.com/aptible/supercronic/releases
ENV SUPERCRONIC_URL=https://github.com/aptible/supercronic/releases/download/v0.2.29/supercronic-linux-amd64 \
    SUPERCRONIC=supercronic-linux-amd64 \
    SUPERCRONIC_SHA1SUM=cd48d45c4b10f3f0bfdd3a57d054cd05ac96812b

RUN curl -fsSLO "$SUPERCRONIC_URL" \
 && echo "${SUPERCRONIC_SHA1SUM}  ${SUPERCRONIC}" | sha1sum -c - \
 && chmod +x "$SUPERCRONIC" \
 && mv "$SUPERCRONIC" "/usr/local/bin/${SUPERCRONIC}" \
 && ln -s "/usr/local/bin/${SUPERCRONIC}" /usr/local/bin/supercronic

USER steam

ENV TIMEZONE=America/Los_Angeles \
    DEBIAN_FRONTEND=noninteractive \
    PUID=0 \
    PGID=0 \
    ALWAYS_UPDATE_ON_START=true \
    MAX_PLAYERS=16 \
    MULTITHREAD_ENABLED=true \
    COMMUNITY_SERVER=true \
    RCON_ENABLED=true \
    PUBLIC_IP=10.0.0.1 \
    PUBLIC_PORT=8211 \
    SERVER_NAME=antisoft.club \
    SERVER_DESCRIPTION="Join our discord at http://discord.antisoft.club" \
    SERVER_PASSWORD=serverPasswordHere \
    ADMIN_PASSWORD=adminPasswordHere \
    BACKUP_ENABLED=true \
    BACKUP_CRON_EXPRESSION="0 * * * *"

VOLUME [ "/palworld" ]

EXPOSE 8211/udp
EXPOSE 25575/tcp

ADD --chmod=777 servermanager.sh /servermanager.sh
ADD --chmod=777 backupmanager.sh /backupmanager.sh

CMD ["/servermanager.sh"]
