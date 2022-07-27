ZSH=/usr/share/oh-my-zsh/
# ZSH_THEME="emotty"
ZSH_THEME="zhann"

zstyle ':omz:update' mode auto      # update automatically without asking

DISABLE_UNTRACKED_FILES_DIRTY="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# too many plugins slow down shell startup.
# https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins 
plugins=(git lein fasd fzf)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

export PATH=$PATH:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$HOME/.local/share/solana/install/active_release/bin:$HOME/.cargo/bin:$HOME/jost/android-studio/bin:/opt/android-sdk/cmdline-tools/latest/bin:/opt/android-sdk/platform-tools:~/.pub-cache/bin:~/Android/Sdk/tools/bin:~/Android/Sdk/platform-tools:$HOME/jost/src/flutter/bin:/usr/lib/jvm/java-17-openjdk/bin:~/.local/share/nvim/site/pack/paqs/start/vim-iced/bin
export ANDROID_NDK_HOME=~/Android/Sdk/ndk
export NDK_HOME=~/Android/Sdk/ndk
export ANDROID_SDK_ROOT=~/Android/Sdk
export CHROME_EXECUTABLE=/usr/bin/chromium
export _JAVA_AWT_WM_NONREPARENTING=1
export GO111MODULE='on'
export GITHUB_PAGE_DIR=~/jost/log/krapjost.github.io

# jabba
[ -s "/home/krap/.jabba/jabba.sh" ] && source "/home/krap/.jabba/jabba.sh"
export JABBA_HOME="$HOME/.jabba"
[ -s "$JABBA_HOME/jabba.sh" ] && source "$JABBA_HOME/jabba.sh"
[ -e ~/.dircolors ] && eval $(dircolors -b ~/.dircolors) || eval $(dircolors -b)
# jabba end
# pnpm
export PNPM_HOME="/home/krap/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
# fzf setting
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build,go/pkg,anaconda3,android-studio,gutenberg_data} --type f"

source $ZSH/oh-my-zsh.sh
source /usr/share/nvm/init-nvm.sh

function pet-select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N pet-select
stty -ixon
bindkey '^s' pet-select

eval "$(ipfs commands completion bash)"
eval "$(fasd --init auto)"
eval "$(thefuck --alias)"
eval "$(register-python-argcomplete pipx)"

#alias
alias ~~="cd ~/jost/"
alias conf="cd ~/dotfiles && vi .zshrc"
alias vi="nvim"
alias ls="exa --icons"
alias l="exa -alhbH --git --icons"
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
alias luamake=/home/krap/jost/lsp/lua-language-server/3rd/luamake/luamake


# TIL 1 xargs = shell argument. fzf | xargs -i {} echo {}
# TIL 2 ${} = shell parameter expansion, 
#   s=01234567890abcdefgh
#   ${s:7}
#   7890abcdefgh
#   ${s:7:0}
#   
#   ${s:7:2}
#   78
#   ${!prefix*}
#   ${!prefix@}
#   Expands to the names of variables whose names begin with prefix,
#   separated by the first character of IFS special variables.
#   ${!name[@]}
#   ${!name[*]}
#   if name is an array, expands to the list of array indices assigned in name.
#   if not, expands to 0 if name is set and null otherwise.
#   ${#parameter}
#   the length in characters of the expanded value of parameter is substituted.
#   ${parameter#word}
#   ${parameter##word}
#   ${parameter%word}
#   ${parameter%%word}
#   ${parameter/pattern/string}
#   ${parameter^pattern}
#   ${parameter^^pattern}
#   ${parameter,pattern}
#   ${parameter,,pattern}
#   zsh이랑 bash랑 조금 다르다. 쉡스크립트보단 범용적인걸로 짜야겠다
cdf () {
    local dir=$(fd --type d | fzf)
    cd $dir
}
vif () {
    cd ~
    local fullpath=$(fzf)
    # 왼쪽부터 마지막 일치하는 /까지 지운다.
    local filename="${fullpath##*/}"
    # 오른쪽부터 처음 일치하는 /까지 지운다.
    local dirpath="${fullpath%/*}"
    # echo $dirpath
    # echo $filename
    cd $dirpath && vi $filename
}
