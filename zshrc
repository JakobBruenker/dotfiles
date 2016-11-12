# `dir` := `cd dir`
setopt AUTO_CD

# cd := pushd
setopt AUTO_PUSHD

# globbing stuff
setopt GLOB_COMPLETE
setopt PUSHD_MINUS

# silent pushd
setopt PUSHD_SILENT

# `pushd` goes to ~
setopt PUSHD_TO_HOME

# ignores multiple duplicate pushd entries
setopt PUSHD_IGNORE_DUPS

# waits 10 seconds when you type `rm *`
setopt RM_STAR_WAIT

# use magic
setopt ZLE
setopt NO_HUP

# editor
export EDITOR="nvim"

setopt IGNORE_EOF

setopt NO_FLOW_CONTROL

setopt NO_CLOBBER

setopt NO_CASE_GLOB

setopt NUMERIC_GLOB_SORT

setopt EXTENDED_GLOB

# remember that single quotes delay command substitution

alias vim='nvim'
alias vi='vim'
alias v='vi'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias cd-='cd -'
alias cdd='cd -'
alias df='df -h'
alias mem='free -h'
alias t='date | sed -r ''s/(\w+ ){3}(\w+:\w+):\w+( \w+){2}/\2/'''
alias ghci='stack ghci'
alias p='xclip -o'
alias y='xclip'
alias yy='mpv $(p) --fs --volume=70 --save-position-on-quit --force-window=immediate'
alias term='urxvtc'
alias formats='youtube-dl $(p) -F'
alias ys='mpsyt /'

# Environment variables

export PATH=$HOME/.local/bin:$PATH
