# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# <<< plugins>>>

source ~/powerlevel10k/powerlevel10k.zsh-theme
# source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
#     zstyle ':autocomplete:*' min-input 1
#     zstyle ':autocomplete:*' insert-unambiguous yes
#     zstyle ':autocomplete:*' widget-style menu-complete
#
#

zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Z}'
autoload -U compinit  && compinit

# System
alias vi="nvim"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias iris='vi ~/qmk_firmware/keyboards/keebio/iris/keymaps/at1047/keymap.c'
alias dps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}\t{{.Status}}"'
alias tmux='TERM=xterm-256color tmux'
alias ls="exa -al --color=always --group-directories-first"
alias reload="source ~/.zshrc"
alias sand="cd ~/Desktop/sandbox"
alias vrc="vi ~/.config/nvim/init.vim"
alias zrc="vi ~/.zshrc"
alias documents="cd ~/Documents"
alias downloads="cd ~/Downloads"


# Class specific
alias school="cd ~/OneDrive\ -\ Georgia\ Institute\ of\ Technology/School"
alias fall="cd ~/OneDrive\ -\ Georgia\ Institute\ of\ Technology/School/Fall\ 2022"
alias matlab="/Applications/MATLAB_R2021b.app/bin/matlab"
alias ml="cd ~/Library/CloudStorage/OneDrive-GeorgiaInstituteofTechnology/School/Fall\ 2022/CS\ 4641/CS4641_MLProject"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/andrew/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/andrew/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/andrew/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/andrew/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.1.0/bin:$PATH"

