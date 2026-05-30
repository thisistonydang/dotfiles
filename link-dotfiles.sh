#!/bin/bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
	local src="$1" dst="$2"
	mkdir -p "$(dirname "$dst")"
	if [[ -e "$dst" && ! -L "$dst" ]]; then
		echo "refusing to overwrite (not a symlink): $dst" >&2
		exit 1
	fi
	ln -sfn "$src" "$dst"
	echo "linked: $dst -> $src"
}

link "$ROOT/.gitconfig" "$HOME/.gitconfig"
link "$ROOT/.gitignore_global" "$HOME/.gitignore_global"
link "$ROOT/.iex.exs" "$HOME/.iex.exs"
link "$ROOT/.zshrc" "$HOME/.zshrc"

link "$ROOT/yabairc" "$HOME/.config/yabai/yabairc"
link "$ROOT/skhdrc" "$HOME/.config/skhd/skhdrc"
link "$ROOT/starship.toml" "$HOME/.config/starship.toml"

link "$ROOT/config.ghostty" "$HOME/Library/Application Support/com.mitchellh.ghostty/config.ghostty"
