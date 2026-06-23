#!/usr/bin/env bash
# Bootstraps a new Mac from this dotfiles repo.
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Installing Homebrew (if missing)"
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "==> Installing taps, formulae, and casks from Brewfile"
brew bundle --file="$DOTFILES_DIR/brew/Brewfile"

echo "==> Symlinking shell + git config"
for f in .zshrc .zprofile; do
  [ -e "$HOME/$f" ] && mv "$HOME/$f" "$HOME/$f.bak.$(date +%s)"
  ln -sf "$DOTFILES_DIR/zsh/$f" "$HOME/$f"
done
for f in .gitconfig .gitignore_global; do
  [ -e "$HOME/$f" ] && mv "$HOME/$f" "$HOME/$f.bak.$(date +%s)"
  ln -sf "$DOTFILES_DIR/git/$f" "$HOME/$f"
done

echo "==> Setting up ~/.zshrc.local (secrets, not tracked by git)"
if [ ! -f "$HOME/.zshrc.local" ]; then
  cp "$DOTFILES_DIR/zsh/.zshrc.local.example" "$HOME/.zshrc.local"
  echo "    Created ~/.zshrc.local — fill in your real secrets there."
fi

echo "==> Setting up ~/.npmrc (registry settings, not tracked by git)"
if [ ! -f "$HOME/.npmrc" ]; then
  cp "$DOTFILES_DIR/npm/.npmrc.template" "$HOME/.npmrc"
  echo "    Created ~/.npmrc — add your auth tokens there."
fi

echo "==> Symlinking mise config and installing pinned tool versions"
ln -sf "$DOTFILES_DIR/mise/.mise.toml" "$HOME/.mise.toml"
eval "$(mise activate bash)"
mise install

echo "==> Installing global npm packages"
while read -r pkg; do
  [ -n "$pkg" ] && npm install -g "$pkg"
done < "$DOTFILES_DIR/npm/global-packages.txt"

if command -v code >/dev/null 2>&1; then
  echo "==> Installing VS Code extensions"
  while read -r ext; do
    [ -n "$ext" ] && code --install-extension "$ext"
  done < "$DOTFILES_DIR/vscode/extensions.txt"
else
  echo "    VS Code 'code' CLI not found yet — run vscode/extensions.txt install later (Cmd+Shift+P > Shell Command: Install 'code' command in PATH)."
fi

cat <<'EOF'

==> Done with the scriptable part. Manual steps remaining:
  - Review brew/MANUAL-APPS.md for apps that aren't installed via Homebrew
    (downloaded directly / Mac App Store) and reinstall the ones you still want.
  - Sign in to the Mac App Store and run: mas list  (then mas install <id> for anything missing)
  - Re-authenticate: gh auth login, gcloud auth login, npm login, ssh keys, 1Password/Authy, etc.
  - Copy over ~/.ssh keys and any GOOGLE_APPLICATION_CREDENTIALS json files manually (not in this repo).
EOF
