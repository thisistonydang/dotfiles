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
