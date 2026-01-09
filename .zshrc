# =============================================================================
# 1. P10K INSTANT PROMPT (Must be at the very top)
# =============================================================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# =============================================================================
# 2. BASIC ENVIRONMENT & PATH
# =============================================================================
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export LANG=en_US.UTF-8
export EDITOR='nvim'

# Clean Path Strategy:
# 1. Add user local bins to the FRONT.
# 2. Add System-wide custom bins (TexLive).
# 3. Do NOT manually add /bin or /usr/bin (System handles this).
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export PATH="$PATH:/usr/local/texlive/2025/bin/x86_64-linux"

# =============================================================================
# 3. ZSH SETTINGS & COMPLETION
# =============================================================================
# Case insensitive completion (lowercase matches uppercase)
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

# Initialize completion system
autoload -Uz compinit
compinit

# =============================================================================
# 4. ALIASES & FUNCTIONS
# =============================================================================
alias vi="nvim"
alias ls="eza -al --color=always --group-directories-first"
alias ll="ls"
alias reload="source ~/.zshrc"
alias tmux='TERM=xterm-256color tmux'

# Navigation Shortcuts
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias sand="cd ~/Desktop/sandbox"
alias documents="cd ~/Documents"
alias downloads="cd ~/Downloads"
alias arduino="cd ~/Documents/Arduino"
alias berkeley="cd ~/Documents/berkeley/Sp26"

# Config Editing
alias vrc="vi ~/.config/nvim/init.lua"
alias cdv="vi ~/.config/nvim/"
alias zrc="vi ~/.zshrc"

# Tools
alias dps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}\t{{.Status}}"'
alias air="~/go/bin/air"
alias digiocean="ssh andrew@143.198.190.249"
alias myscrot='scrot -s ~/Pictures/Screenshots/%b%d::%H%M%S.png'

# Tmux Smart Switcher
function tm() {
  if [ -z $1 ]; then
    tmux switch-client -l
  else
    if [ -z "$TMUX" ]; then
      tmux new-session -As $1
    else
      if ! tmux has-session -t $1 2>/dev/null; then
        TMUX= tmux new-session -ds $1
      fi
      tmux switch-client -t $1
    fi
  fi
}

# =============================================================================
# 5. EXTERNAL TOOLS (NVM, MuJoCo)
# =============================================================================
# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# MuJoCo Physics Engine
export MUJOCO_PY_MUJOCO_PATH="$HOME/.mujoco/mujoco210"
export MUJOCO_PY_MJKEY_PATH="$HOME/.mujoco/mujoco210/bin/mjkey.txt"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/.mujoco/mujoco210/bin

# =============================================================================
# 6. THEME (Powerlevel10k)
# =============================================================================
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# =============================================================================
# 7. CONDA INITIALIZATION (MUST BE LAST)
# =============================================================================
# Silence the OpenSSL legacy provider warning
export PYTHONWARNINGS="ignore:OpenSSL 3's legacy provider failed to load"
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$PATH:/opt/miniconda3/bin"
    fi
fi
unset __conda_setup

# alias python="/opt/miniconda3/bin/python"
# alias pip="/opt/miniconda3/bin/pip"

# <<< conda initialize <<<


