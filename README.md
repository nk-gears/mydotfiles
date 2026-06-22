# mydotfiles

Snapshot of this Mac's dev environment, for setting up the new MacBook Pro 16".

## What's tracked here

- `brew/Brewfile` — every Homebrew tap, formula, and cask currently installed (`brew bundle dump`)
- `zsh/.zshrc`, `zsh/.zprofile` — shell config, secrets stripped out
- `git/.gitconfig`, `git/.gitignore_global` — git identity and global ignores
- `npm/global-packages.txt` — globally installed npm packages
- `npm/.npmrc.template` — npm settings without auth tokens
- `vscode/extensions.txt` — installed VS Code extensions
- `brew/MANUAL-APPS.md` — apps in `/Applications` that were **not** installed via Homebrew (downloaded directly, or Mac App Store) — these can't be scripted and need manual reinstall/review

## What's NOT tracked (on purpose)

- Secrets: `CIRCLE_CI_TOKEN`, npm auth tokens, GCP service-account JSON files, SSH keys.
  These live in `~/.zshrc.local` (gitignored, sourced from `.zshrc`) and `~/.npmrc` — set them up by hand on the new machine.
- Mac App Store apps (`mas` wasn't signed into an Apple ID when this was generated, so it couldn't see them — run `mas list` once signed in on the old machine if you want that list too).
- Anything installed by drag-and-drop / DMG with no Homebrew cask equivalent — see `brew/MANUAL-APPS.md`.

## Setup on the new MacBook

```bash
git clone <this-repo-url> ~/mydotfiles   # or copy the folder over directly
cd ~/mydotfiles
./install.sh
```

`install.sh` will:
1. Install Homebrew if missing
2. `brew bundle` everything in `brew/Brewfile`
3. Symlink `.zshrc`/`.zprofile`/`.gitconfig`/`.gitignore_global` into `$HOME` (backing up anything pre-existing)
4. Create `~/.zshrc.local` and `~/.npmrc` from templates for you to fill in
5. Install nvm + latest LTS Node, then the npm globals
6. Install your pyenv Python version
7. Install your VS Code extensions (if `code` CLI is on PATH)

Then finish manually:
- Fill in `~/.zshrc.local` (`CIRCLE_CI_TOKEN`, etc.) and `~/.npmrc` (auth tokens)
- `gh auth login`, `gcloud auth login`, `npm login`
- Copy over `~/.ssh` keys and any `GOOGLE_APPLICATION_CREDENTIALS` json files (e.g. the Terraform admin key referenced by the `spset` alias) via AirDrop/encrypted USB — never through git
- Go through `brew/MANUAL-APPS.md` and reinstall whichever of those apps you still use
