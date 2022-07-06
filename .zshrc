# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export PATH=$HOME/.local/bin:$PATH

autoload -U colors && colors
setopt histignorealldups sharehistory

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/.zsh_history
colorscript -r
# Aliases

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias mic='~/mic_over_mumble' #use my phone as mic 
# Use modern completion system
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''
zmodload zsh/complist
compinit -d $HOME/.cache/zcompdump
_comp_options+=(globdots)

eval "$(dircolors -b)"

[[ ! -f ~/.config/.p10k.zsh ]] || source ~/.config/.p10k.zsh
eval "$(starship init zsh)"
