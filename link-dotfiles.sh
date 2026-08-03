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

link "$ROOT/starship.toml" "$HOME/.config/starship.toml"

link "$ROOT/config.ghostty" "$HOME/Library/Application Support/com.mitchellh.ghostty/config.ghostty"

link "$ROOT/btop/themes/rose-pine.theme" "$HOME/.config/btop/themes/rose-pine.theme"
link "$ROOT/btop/themes/rose-pine-moon.theme" "$HOME/.config/btop/themes/rose-pine-moon.theme"
link "$ROOT/btop/themes/rose-pine-dawn.theme" "$HOME/.config/btop/themes/rose-pine-dawn.theme"
