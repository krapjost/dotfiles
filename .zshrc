# If you come from bash you might have to change your $PATH.

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bureau"

zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

#alias
alias ~~="cd ~/jost/"
alias vi="nvim"
alias job="cd ~/jost/job"
alias ref="cd ~/jost/ref"
alias tut="cd ~/jost/tutorials"

export PATH=$PATH:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$HOME/.local/share/solana/install/active_release/bin:$HOME/.cargo/bin:$HOME/jost/android-studio/bin:/opt/android-sdk/cmdline-tools/latest/bin:/opt/android-sdk/platform-tools:~/.pub-cache/bin
export CHROME_EXECUTABLE=/usr/bin/chromium
export _JAVA_AWT_WM_NONREPARENTING=1
export GO111MODULE='on'

source $ZSH/oh-my-zsh.sh
source /usr/share/nvm/init-nvm.sh
eval "$(ipfs commands completion bash)"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/krap/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/krap/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/krap/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/krap/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# <<< conda initialize <<<
