#!/bin/sh
set -eu

if [ "${EULA:-FALSE}" != "TRUE" ]; then
  echo "Server se nespustí: nastav EULA=TRUE v compose.yaml." >&2
  exit 1
fi

mkdir -p /data
printf 'eula=true\n' > /data/eula.txt

exec java -Xms"${MEMORY:-1G}" -Xmx"${MEMORY:-2G}" \
  -jar /opt/minecraft/server.jar nogui
