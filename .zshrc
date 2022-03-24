# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bureau"

zstyle ':omz:update' mode auto      # update automatically without asking

DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# 
plugins=(git)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

#alias
alias ~~="cd ~/jost/"
alias vi="nvim"
alias work="cd ~/projects"
alias log="cd ~/jost/log"
alias ref="cd ~/jost/ref"
alias tut="cd ~/jost/tutorials"
alias conf="cd ~/dotfiles && vi .zshrc"
alias ryev="cd ~/jost/ref/flutter/rye/frontend && vi lib/main.dart"
alias rye="cd ~/jost/ref/flutter/rye/frontend"

export PATH=$PATH:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$HOME/.local/share/solana/install/active_release/bin:$HOME/.cargo/bin:$HOME/jost/android-studio/bin:/opt/android-sdk/cmdline-tools/latest/bin:/opt/android-sdk/platform-tools:~/.pub-cache/bin:~/Android/Sdk/tools/bin:~/Android/Sdk/platform-tools

export ANDROID_NDK_HOME=~/Android/Sdk/ndk
export NDK_HOME=~/Android/Sdk/ndk
export ANDROID_SDK_ROOT=~/Android/Sdk
export CHROME_EXECUTABLE=/usr/bin/chromium
export _JAVA_AWT_WM_NONREPARENTING=1
export GO111MODULE='on'
export GITHUB_PAGE_DIR=~/jost/log/krapjost.github.io

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
