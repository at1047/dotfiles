export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
# export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="gruvbox"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
# plugins=(git)
# Terminal autocomplete fix
# autoload -Uz compinit && compinit

# ~/.oh-my-zsh/custom/plugins/
# plugins=(
#     git
#     # docker
#     # asdf
#     # zsh-autosuggestions
#     # zsh-completions 
#     zsh-history-substring-search 
#     zsh-syntax-highlighting
#     # fzf-tab
# )
# source $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# # 
# source $ZSH/oh-my-zsh.sh

# zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
# zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
autoload -Uz compinit
compinit
# zstyle ':completion:*' matcher-list 'r:|[. _-]=* r:|=*' 'l:|=* r:|=*'
# zstyle ':completion:*' matcher-list 'r:[[:ascii:]]||[[:ascii:]]=** r:|=* m:{a-z\-}={A-Z\_}'
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/Cellar/neovim/0.11.4/bin:$PATH"
export PATH="/usr/local/texlive/2025basic/bin:$PATH"

# <<< plugins>>>

source ~/powerlevel10k/powerlevel10k.zsh-theme
# source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
#     zstyle ':autocomplete:*' min-input 1
#     zstyle ':autocomplete:*' insert-unambiguous yes
#     zstyle ':autocomplete:*' widget-style menu-complete
#
#

# zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Z}'
# autoload -U compinit  && compinit

# System
alias vi="nvim"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias dps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}\t{{.Status}}"'
alias tmux='TERM=xterm-256color tmux'
alias ls="eza -al --color=always --group-directories-first"
alias reload="source ~/.zshrc"
alias sand="cd ~/Desktop/sandbox"
# alias vrc="vi ~/.config/nvim/init.vim"
alias vrc="vi ~/.config/nvim/init.lua"
alias cdv="vi ~/.config/nvim/"
alias zrc="vi ~/.zshrc"
alias documents="cd ~/Documents"
alias downloads="cd ~/Downloads"
alias arduino="cd ~/Documents/Arduino"
alias air="~/go/bin/air"
alias digiocean="ssh andrew@143.198.190.249"
alias joy="vi ~/Desktop/sandbox/joyeuse/colors/joyeuse.vim"
alias berkeley="cd '/home/andrew/Documents/berkeley/Fa25'"
alias myscrot='scrot -s ~/Pictures/Screenshots/%b%d::%H%M%S.png'


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

function arduino_upload() {
  arduino-cli compile --fqbn $1 $2
  arduino-cli upload --port $3 --fqbn $1
  echo "Upload successful"
}


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/andrew/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/andrew/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/andrew/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/andrew/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.1.0/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"


# Created by `pipx` on 2025-09-24 17:35:34
export PATH="$PATH:/usr/local/include"
export PATH="$PATH:/usr/local/share/applications"
export PATH="$PATH:/Users/andrew/.local/bin"
export PATH="$PATH:/Users/andrew/.local/share/applications"
export PATH="$PATH:/usr/local/texlive/2025/bin/x86_64-linux"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:~/.mujoco/mujoco200/bin"
export MUJOCO_PY_MUJOCO_PATH="$HOME/.mujoco/mujoco210"
export MUJOCO_PY_MJKEY_PATH="$HOME/.mujoco/mujoco210/bin/mjkey.txt"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/andrew/.mujoco/mujoco210/bin
