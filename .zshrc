alias ii="ifconfig en0 | grep 'inet ' | awk '{print \$2}'"
alias teee="tee >(pbcopy)"
alias dp="docker ps"
alias dcd="docker compose down"
alias dcu="docker compose up -d"
alias dcr="docker compose restart"
alias dsp="docker system prune -af"
alias ddp="docker compose down && docker system prune -af"
alias ddpu="docker compose down && docker system prune -af && docker compose up -d"
alias di="docker images"
alias ll="ls -al"
alias II="open"
alias explorer="open"
alias gs="git status"
alias gpo="git pull origin"
alias gd="git diff"
alias gl="git log"
alias gg="git log --graph --date-order -C -M --pretty=format:\"<%h> %ad [%an] %C(cyan)%d%Creset %s\" --all --date=short"
alias sz="source ~/.zshrc"
alias free="vm_stat"
alias today="date '+%Y%m%d'"

# ネタ
alias weather="curl wttr.in/Tokyo"

export PATH="$HOME/brewpythonenv/bin:$PATH"

# history
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

# share .zshhistory
setopt inc_append_history
setopt share_history

# peco history
function peco-history-selection() {
    # BUFFER=`history -n 1 | tac | awk '!a[$0]++' | peco`
    BUFFER=`history -n 1 | tac | grep -v /homebrew/bin/python3 | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}


zle -N peco-history-selection
bindkey '^R' peco-history-selection

function git-add-fzf() {
  # ステージングするファイルを選択
  local files=$(git ls-files --others --modified --exclude-standard | fzf -m)

  # 選択されたファイルを git add
  if [ -n "$files" ]; then
    echo "$files" | xargs git add
  else
    echo "No files selected."
  fi
}

# fvim function definition
function fvim() {
  # ファイルパスが引数として渡されなかった場合はエラーメッセージを表示して終了
  if [ -z "$1" ]; then
    echo "Usage: fvim <file_path>"
    return 1
  fi

  # 引数からファイルパスを取得
  local file_path=$1

  # ディレクトリ部分を抽出
  local dir=$(dirname "$file_path")

  # VimとFernで指定されたディレクトリおよびファイルを開き、ターミナルをウィンドウ下部に高さ10行で配置
  vim -c ":bo term" -c ":resize 15" -c ":wincmd k" -c ":Fern . -reveal=% -drawer -toggle -width=40" -c ":wincmd l" .
}

# git コマンドプロンプトカスタマイズ
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# プロンプトカスタマイズ
PROMPT='
[%B%F{red}%n@%m%f%b:%F{green}%~%f]%F{cyan}$vcs_info_msg_0_%f
%F{yellow}$%f '

# git 型補完
fpath=(
    ${HOME}/.zsh/completions
    ${fpath}
)
autoload -Uz compinit
compinit
# source ~/.zsh/git-completion.bash

