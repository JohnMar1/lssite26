FROM eclipse-temurin:21-jre

WORKDIR /opt/minecraft

# server.jar získáme z oficiální stránky Minecraftu a vložíme do build contextu.
COPY server.jar /opt/minecraft/server.jar
COPY start.sh /usr/local/bin/start-minecraft

RUN chmod +x /usr/local/bin/start-minecraft \
    && useradd --create-home --uid 1000 minecraft \
    && mkdir -p /data \
    && chown -R minecraft:minecraft /opt/minecraft /data /usr/local/bin/start-minecraft

USER minecraft
EXPOSE 25565
VOLUME ["/data"]
ENTRYPOINT ["start-minecraft"]
