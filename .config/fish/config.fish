if status is-interactive
    # Commands to run in interactive sessions can go here
#starship init fish | source
colorscript -r
# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias mic='~/mic_over_mumble' #use my phone as mic 
end
