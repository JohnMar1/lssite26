#!/usr/bin/env bash
# Spusť přes source, aby po dokončení zůstal terminál ve složce ~/mc-server:
# source <(curl -fsSL https://raw.githubusercontent.com/JohnMar1/lssite26/main/06_Minecraft_v_Dockeru/pripravit-mc-server.sh)

set -o pipefail

DEFAULT_SOURCE_URL="https://raw.githubusercontent.com/JohnMar1/lssite26/main/06_Minecraft_v_Dockeru"
SCRIPT_PATH="${BASH_SOURCE[0]:-$0}"
SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$SCRIPT_PATH")" && pwd -P)"

is_sourced=0
if [ -n "${BASH_VERSION:-}" ] && [ "${BASH_SOURCE[0]}" != "$0" ]; then
  is_sourced=1
elif [ -n "${ZSH_EVAL_CONTEXT:-}" ]; then
  case "$ZSH_EVAL_CONTEXT" in
    *:file) is_sourced=1 ;;
  esac
fi

download_file() {
  local source_url="$1"
  local destination="$2"

  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$source_url" -o "$destination"
  elif command -v wget >/dev/null 2>&1; then
    wget -qO "$destination" "$source_url"
  else
    printf 'Chybí curl nebo wget. Nainstaluj jednu z těchto utilit a spusť skript znovu.\n' >&2
    return 1
  fi
}

main() {
  local target_dir source_url source_dir staging_dir file

  if [ -z "${HOME:-}" ]; then
    printf 'Proměnná HOME není nastavena.\n' >&2
    return 1
  fi

  target_dir="${MC_SERVER_DIR:-$HOME/mc-server}"
  source_url="${MC_SERVER_SOURCE_URL:-$DEFAULT_SOURCE_URL}"
  source_dir="${MC_SERVER_SOURCE_DIR:-$SCRIPT_DIR}"

  case "$target_dir" in
    "$HOME"/*) ;;
    *)
      printf 'Cílová složka musí být uvnitř domovského adresáře: %s\n' "$target_dir" >&2
      return 1
      ;;
  esac

  if [ -e "$target_dir" ] || [ -L "$target_dir" ]; then
    printf 'Složka %s už existuje; kvůli ochraně existujících dat ji nepřepisuji.\n' "$target_dir" >&2
    return 1
  fi

  staging_dir="$(mktemp -d "$HOME/.mc-server.XXXXXX")" || return 1

  for file in Dockerfile docker-compose.yml start.sh; do
    if [ -f "$source_dir/$file" ]; then
      cp "$source_dir/$file" "$staging_dir/$file"
    elif ! download_file "$source_url/$file" "$staging_dir/$file"; then
      rm -rf "$staging_dir"
      printf 'Stažení %s selhalo.\n' "$file" >&2
      return 1
    fi
  done

  chmod +x "$staging_dir/start.sh" || {
    rm -rf "$staging_dir"
    return 1
  }
  mv "$staging_dir" "$target_dir" || {
    rm -rf "$staging_dir"
    return 1
  }

  cd "$target_dir" || return 1
  printf 'Hotovo. Soubory jsou v %s\n' "$target_dir"
  printf 'Další krok: docker compose up -d --build\n'

  if [ "$is_sourced" -ne 1 ]; then
    printf 'Pro automatické přepnutí do této složky spusť skript přes source.\n'
  fi
}

main "$@"
status=$?

if [ "$is_sourced" -eq 1 ]; then
  return "$status"
fi

exit "$status"
