# Dotfiles

A collection of my dotfiles for quickly setting up a new development machine.

On a new machine, run [`link-dotfiles.sh`](link-dotfiles.sh) (e.g. `bash /path/to/dotfiles/link-dotfiles.sh`) to symlink these configs into `$HOME` and `$HOME/.config`.

## Vendored: rose-pine/btop

Source: https://github.com/rose-pine/btop (`main`)

Update:

```bash
git subtree pull --prefix=btop/themes https://github.com/rose-pine/btop.git main --squash
```
