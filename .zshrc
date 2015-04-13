# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="wedisagree"

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# RStudio server login
##alias rserver="ssh murakami@192.168.0.15"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# Export path for nodebrew
##if [[ -f ~/.nodebrew/nodebrew ]]; then
##	export PATH=$HOME/.nodebrew/current/bin:$PATH
##	nodebrew use v0.11.6
##fi

##if [[ -f ~/.rbenv/bin ]]; then
##	export PATH="$HOME/.rbenv/bin:$PATH"
##	eval "$(rbenv init -)"
##fi

##export R_HOME=/usr/lib/R

# cdコマンド後にlsを自動実行
function chpwd() { ls -F }

# history 履歴に時刻を付加する
setopt extended_history  # share_history でもOK

function hist() {
	if [ $# != 0 ]; then
		history | grep $@
	else
		history
	fi
}

# ^を押すと上の階層へ
# http://qiita.com/items/b01536fa63d9f8fadf4f
cdup() {
if [ -z "$BUFFER" ]; then
	echo
	cd ..
	if type precmd > /dev/null 2>&1; then
		precmd
	fi
	local precmd_func
	for precmd_func in $precmd_functions; do
	$precmd_func
	done
	zle reset-prompt
	else
	zle self-insert '^'
fi
}

zle -N cdup
bindkey '\^' cdup
## export PATH="$HOME/.rbenv/bin:$PATH"
## eval "$(rbenv init -)"
