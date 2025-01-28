# History
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

# The following lines were added by compinstall
zstyle :compinstall filename '~/.config/zsh/.zshrc'

# This will prevent the typed characters from being displayed on the terminal before loading zsh, followed by the % prompt.
unsetopt PROMPT_SP

# Set case sensitive to false like Fish shell
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

[[ $- != *i* ]] && return
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cat='bat'
alias rcat='\cat'

autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
	you-should-use
)

autoload -Uz compinit
compinit

source $ZSH/oh-my-zsh.sh
command -v starship &>/dev/null && eval "$(starship init zsh)"
