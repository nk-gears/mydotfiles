# mise — manages Node/Python/Java versions (replaces nvm/pyenv/sdkman)
eval "$(mise activate zsh)"
export HISTFILE=~/.zsh_history
#export PATH="/Users/Nirmal/.claude/local:$PATH"
autoload -U promptinit; promptinit
zmodload zsh/nearcolor
zstyle :prompt:pure:path color '#FFE812'
zstyle ':prompt:pure:prompt:*' color cyan
prompt pure

# Initialize completions with error handling
# Skip missing completion files gracefully
autoload -Uz compinit
# Use -i flag to ignore security issues, -C for fast init, and suppress errors
if [ -f ~/.zcompdump ]; then
  # Check if dump file exists and is older than a week, remove it for fresh init
  if [ ~/.zcompdump -ot ~/.zshrc ]; then
    rm -f ~/.zcompdump
  fi
fi
compinit -i -C 2>/dev/null || compinit -i 2>/dev/null || true
alias coded="code --disable-extensions"
alias spset=" export GOOGLE_APPLICATION_CREDENTIALS=/Users/Nirmal/projects/freelancing/shelfperks-v2/shelfperks_devops/infra-provisioning/secrets/teraform-admin-key-2025.json"
alias genv="gcloud auth application-default login"
alias cloud="ssh root@139.84.141.97"
alias toc=/usr/local/bin/toggle-openclaw
# Aliases with path validation
if [ -f "/Users/Nirmal/projects/appdews/nook-simple-touch-quote-frame/python-vercel/playsel.sh" ]; then
  alias play=/Users/Nirmal/projects/appdews/nook-simple-touch-quote-frame/python-vercel/playsel.sh
fi

alias playot=/Users/Nirmal/projects/appdews/nook-simple-touch-quote-frame/python-vercel/play-ot.sh
alias plays=/Users/Nirmal/projects/appdews/nook-simple-touch-quote-frame/python-vercel/plays.sh
alias playctl=/Users/Nirmal/projects/appdews/nook-simple-touch-quote-frame/python-vercel/playctl.sh

#exportPATH "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# DIP alias with validation
if [ -f "/Users/Nirmal/dip.sh" ]; then
  alias dip='sh /Users/Nirmal/dip.sh'
fi
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
alias popos="ssh nirmal@192.168.1.28"
# zsh-histdb initialization with error handling
if [ -f "$HOME/.oh-my-zsh/custom/plugins/zsh-histdb/sqlite-history.zsh" ]; then
  source "$HOME/.oh-my-zsh/custom/plugins/zsh-histdb/sqlite-history.zsh"
  autoload -Uz add-zsh-hook
  HISTDB_TABULATE_CMD=(sed -e $'s/\x1f/\t/g')
fi
#export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="$PATH:/usr/local/bin/"
export PATH="$PATH:/Users/Nirmal/.dotnet/tools/"
export PATH="$PATH:$HOME/.composer/vendor/bin"
# Additional aliases with validation
if [ -f "/Users/Nirmal/.nvm/versions/node/v18.15.0/bin/yt-play" ]; then
  alias ytplay=/Users/Nirmal/.nvm/versions/node/v18.15.0/bin/yt-play
fi

if [ -f "/Users/Nirmal/cast.sh" ]; then
  alias cast=/Users/Nirmal/cast.sh
fi

if [ -f "/Users/Nirmal/Documents/typora-notes/scripts/sync-notes.sh" ]; then
  alias typo="/Users/Nirmal/Documents/typora-notes/scripts/sync-notes.sh"
fi
export PATH="$PATH:/Users/Nirmal/development/flutter/bin"
alias lkhome="ssh nirmal@192.168.1.16"
alias lkhomes="ssh nirmal@192.168.1.16 '~/projects/scripts/system-halt.sh'"
alias berry="ssh root@192.168.1.13"
# Typora alias with validation
if [ -f "/Applications/Typora.app/Contents/MacOS/Typora" ]; then
  alias typora="/Applications/Typora.app/Contents/MacOS/Typora"
fi
export ANDROID_HOME=/Users/Nirmal/Library/Android
export PATH="${HOME}/Library/Android/sdk/tools:${HOME}/Library/Android/sdk/platform-tools:${PATH}"
#export PATH="$PATH":"$HOME/.pub-cache/bin"
setopt HIST_FIND_NO_DUPS
# following should be turned off, if sharing history via setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

# Script aliases with validation
if [ -f "/Users/Nirmal/scripts/db-push.sh" ]; then
  alias dbpush="/Users/Nirmal/scripts/db-push.sh"
fi

if [ -f "/Users/Nirmal/scripts/pi-push.sh" ]; then
  alias pipush="/Users/Nirmal/scripts/pi-push.sh"
fi

export PATH="$PATH:/Users/Nirmal/development/flutter/bin"
# aliases

alias mk=make
alias nextt=code ~/projects/appdews/learning/notus-nextjs-main
#export PATH="/Users/Nirmal/Library/Python/3.8/bin:$PATH"

#export PATH="/usr/local/opt/python@3.8/bin:$PATH"

# Created by `pipx` on 2021-08-24 11:45:07
export PATH="$PATH:/Users/Nirmal/.local/bin"
alias python='python3'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/Nirmal/developer-tools/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/Nirmal/developer-tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/Nirmal/developer-tools/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/Nirmal/developer-tools/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$HOME/.poetry/bin:$PATH"

function poetry() {
    # if POETRY_DONT_LOAD_ENV is *not* set, then load .env if it exists
    if [[ -z "$POETRY_DONT_LOAD_ENV" && -f .env ]]; then
        echo 'Loading .env environment variables…'
        # Safely export variables from .env file
        set -a
        # shellcheck disable=SC1091
        source .env 2>/dev/null || true
        set +a
        command poetry "$@"
        local poetry_exit=$?
        # Unset variables (only those that were in .env)
        if [ -f .env ]; then
          while IFS='=' read -r key value; do
            [[ "$key" =~ ^[^#] && -n "$key" ]] && unset "$key"
          done < .env
        fi
        return $poetry_exit
    else
        command poetry "$@"
    fi
}

export PATH="/usr/local/opt/libpq/bin:$PATH"

export MEDIUM_ENDPOINT_PREFIX="https://api.medium.com/v1"
export WEBSITE_JSON_INDEX_URL=""
GITHUB_STATUS_REPO_OWNER="your Github account name"
GITHUB_STATUS_REPO="repo name for storing the status of posts to medium.com"
STORAGE_TYPE=""
export STORAGE_FILE_PATH="/OPTIONAL/PATH/TO/STATUS/FILE.json"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

export dotnet=/usr/local/share/dotnet/dotnet

#alias func="/Users/Nirmal/.nvm/versions/node/v14.17.4/bin/func"


# Load .env with error handling
if [ -f "$HOME/.env" ]; then
  if ( set -a; source "$HOME/.env" 2>/dev/null; set +a ); then
    true  # Successfully loaded
  else
    echo "Warning: Failed to load $HOME/.env file" >&2
  fi
fi
# pnpm
export PNPM_HOME="/Users/Nirmal/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
alias gpp="git add . && git commit -m 'updated entity' && git push"

#source "/Users/Nirmal/.wasmedge/env"
#export PATH="/Users/Nirmal/gaianet/bin:$PATH"

# Bluetooth and mic aliases with validation
if [ -f "/Users/Nirmal/Documents/typora-notes/scripts/ble_mic.sh" ]; then
  alias mic="sh /Users/Nirmal/Documents/typora-notes/scripts/ble_mic.sh"
fi

if command -v blueutil &>/dev/null; then
  alias blon="blueutil --power 1 && blueutil --connect 5f-f1-3f-61-c6-99 && mic"
  alias bloff="blueutil --power 0"
fi

# Function to connect to gcloud container clusters with environment substitution
# Add this to your ~/.zshrc file
function gke() {
  # Check if an argument was provided
  if [[ $# -eq 0 ]]; then
    echo "Error: Environment argument required"
    echo "Usage: gke <environment>"
    echo "Example: gke dev"
    return 1
  fi

  # Check if gcloud is available
  if ! command -v gcloud &>/dev/null; then
    echo "Error: gcloud command not found. Please install Google Cloud SDK."
    return 1
  fi

  # Get the environment from the first argument
  local ENV=$1

  # Run the gcloud command with the environment variable substituted
  echo "Connecting to $ENV environment..."
  if gcloud container clusters get-credentials "sp-gke-$ENV-cluster" --zone us-central1-a --project "shelfperks-apps-$ENV" 2>/dev/null; then
    echo "Successfully connected to $ENV environment"
    return 0
  else
    echo "Error: Failed to connect to $ENV environment. Check environment name and credentials."
    return 1
  fi
}


function gkeip() {
  # Check if gcloud is available
  if ! command -v gcloud &>/dev/null; then
    echo "Error: gcloud command not found. Please install Google Cloud SDK."
    return 1
  fi

  local ENV="prod"

  echo "Connecting to $ENV environment (India)..."
  if gcloud container clusters get-credentials "sp-gke-prod-cluster" --zone asia-south1-a --project "shelfperks-apps-in-prod" 2>/dev/null; then
    echo "Successfully connected to $ENV environment"
    return 0
  else
    echo "Error: Failed to connect to $ENV environment. Check credentials."
    return 1
  fi
}


function gkei() {
  # Check if gcloud is available
  if ! command -v gcloud &>/dev/null; then
    echo "Error: gcloud command not found. Please install Google Cloud SDK."
    return 1
  fi

  local ENV="shared"

  echo "Connecting to $ENV environment (India)..."
  if gcloud container clusters get-credentials "sp-gke-np-cluster" --zone asia-south1-a --project "shelfperks-apps-in-shared" 2>/dev/null; then
    echo "Successfully connected to $ENV environment"
    return 0
  else
    echo "Error: Failed to connect to $ENV environment. Check credentials."
    return 1
  fi
}


# Optional: Add command completion for common environments
# Uncomment and modify the environments as needed
# compdef '_values "environments" dev staging prod' connect-cluster

playmp3() {
  if [ -z "$1" ]; then
    echo "Usage: playmp3 http://example.com/audio.mp3"
    return 1
  fi

  if ! command -v adb &> /dev/null; then
    echo "adb not found. Please install Android Platform Tools."
    return 1
  fi

  if ! adb get-state 1>/dev/null 2>&1; then
    echo "No Android device connected via adb."
    return 1
  fi

  echo "Playing $1 on connected Android device..."
  adb shell am start -a android.intent.action.VIEW -d "$1" -t "audio/*"
}

playv() {
  if ! command -v mpv &>/dev/null; then
    echo "Error: mpv command not found. Please install mpv."
    return 1
  fi

  if [ -z "$1" ]; then
    echo "Usage: playv <search query>"
    return 1
  fi

  local query="'$*'"
  mpv --ytdl-format=bestaudio ytdl://ytsearch:$query
}

alias adbplaypause='adb shell input keyevent 85'
alias adbplay='adb shell input keyevent 126'
alias adbpause='adb shell input keyevent 127'
alias colimainit='colima start --cpu 2 --memory 2 --disk 15'

# opencode
export PATH=/Users/Nirmal/.opencode/bin:$PATH
alias kapply='kubectl apply -f'
# secrets (CIRCLE_CI_TOKEN, etc.) live in ~/.zshrc.local — never committed
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

alias evm='set -o allexport; source .env; set +o allexport'
alias kpaste="kubectl apply -f - <<< $(pbpaste)"

# OpenClaw Completion
source "/Users/Nirmal/.openclaw/completions/openclaw.zsh"

# Command Logger - Logs terminal commands to workspace-specific file (VS Code only)
# Only initialize when running inside VS Code terminal
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
    setup_command_logger() {
        # Find workspace root (look for .git directory)
        find_workspace_root() {
            local current_dir="$PWD"
            while [[ "$current_dir" != "/" ]]; do
                if [[ -d "$current_dir/.git" ]]; then
                    echo "$current_dir"
                    return 0
                fi
                current_dir="${current_dir%/*}"
            done
            # If no .git found, use current directory
            echo "$PWD"
        }

        # Log command to workspace history file
        log_command() {
            local workspace_root=$(find_workspace_root)
            local history_file="$workspace_root/.terminal-commands"

            # Get the last executed command
            local cmd="${history[$((HISTCMD-1))]}"

            if [[ -n "$cmd" && ! "$cmd" =~ "^[[:space:]]*$" ]]; then
                echo "[$(date '+%Y-%m-%d %H:%M:%S')] $cmd" >> "$history_file"
            fi
        }

        # Add the logging hook
        autoload -Uz add-zsh-hook
        add-zsh-hook precmd log_command
    }

    # Initialize command logger
    #setup_command_logger
fi
export CLAUDE_CODE_TMPDIR=/Users/Nirmal/Documents/ctemp

# lanscan — LAN network scanner
alias lanscan='sudo python3 /Users/Nirmal/lanscan/lanscan.py'

# Claude Code Account Switcher
eval "$('/Users/Nirmal/.claude-switch/bin/claude-acc' init zsh)"
. "/Users/Nirmal/.acme.sh/acme.sh.env"
