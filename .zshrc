# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Bash history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

codeDir=/home/samuli/Documents/scripts
colorizeLocation=$codeDir/colorize.py

# Typos
alias Cd='cd'
alias cD='cd'
alias CD='cd'
alias dir='ls'
alias copy='cp'

# 3-month calendar
alias cal3='cal -3'

alias editzsh='editbash'
alias sourcezsh='sourcebash'
alias neofetch='fastfetch'

# boot errors
alias error='journalctl -b -p err'

# dotfiles
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# Simple shortcut to edit this file.
function editbash() {
    colorize "^gEditing ~/.zshrc"
    code ~/.zshrc
}

# Simple shortcut to source this file.
function sourcebash() {
    colorize "Doing ^gsource ~/.zshrc"
    source ~/.zshrc
}

# Thin wrapper around Colorize.
function colorize() {
    python3 $colorizeLocation "$@"
}

# Print time in UTC
function utc() {
    colorize "LOCAL: ^y$(date)"
    colorize "UTC  : ^g$(date -u)"
}

# Copies the current directory to the clipboard.
function getcd() {
    pwd | tr -d '\n' | xclip
    colorize "^wCopied ^g${PWD} ^wto the clipboard"
}

# Verbosity and settings that you pretty much just always are going to want.
alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vI" \
	mkd="mkdir -pv" \
	yt="yt-dlp --embed-metadata -i" \
	yta="yt -x -f bestaudio/best"

# Colorize commands when possible.
alias \
	ls="ls -hN --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto"

# Add custom scripts to path
PATH=$PATH:/home/samuli/Documents/scripts
PATH=$PATH:/home/samuli/.dotnet/tools
# Disable telemetry
DOTNET_CLI_TELEMETRY_OPTOUT=1

# source /usr/share/nvm/init-nvm.sh

source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bun completions
[ -s "/home/samuli/.bun/_bun" ] && source "/home/samuli/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
