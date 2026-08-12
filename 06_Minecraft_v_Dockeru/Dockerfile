FROM eclipse-temurin:17-jre-jammy

ARG MINECRAFT_VERSION=1.20.4

WORKDIR /opt/minecraft

# Stáhne oficiální serverový JAR pro zvolenou verzi. Díky tomu není potřeba
# vkládat velký binární soubor server.jar do repozitáře ani do build contextu.
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends ca-certificates curl jq; \
    version_metadata_url="$(curl -fsSL https://piston-meta.mojang.com/mc/game/version_manifest_v2.json | jq -er --arg version "$MINECRAFT_VERSION" '.versions[] | select(.id == $version) | .url')"; \
    server_url="$(curl -fsSL "$version_metadata_url" | jq -er '.downloads.server.url')"; \
    curl -fsSL "$server_url" -o server.jar; \
    ln -s "$(command -v java)" /usr/local/bin/java; \
    groupadd --system minecraft; \
    useradd --system --gid minecraft --home-dir /data --create-home --shell /usr/sbin/nologin minecraft; \
    chown minecraft:minecraft server.jar /data; \
    rm -rf /var/lib/apt/lists/*

COPY --chmod=755 start.sh /usr/local/bin/start-minecraft

EXPOSE 25565/tcp
VOLUME ["/data"]
ENTRYPOINT ["/usr/local/bin/start-minecraft"]
