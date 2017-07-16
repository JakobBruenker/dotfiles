# vim editing mode
bindkey -v

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
alias vis='vim -S .session.vim'
alias vito='vim TODO.qt'
alias v='vi'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias cd-='cd -'
alias cdd='popd'
alias df='df -h'
alias mem='free -h'
alias t='date | sed -r ''s/(\w+ ){3}(\w+:\w+):\w+( \w+){2}/\2/'''
alias h='hoogle'
alias ghc='stack ghc'
alias runghc='stack runghc'
alias ghci='stack ghci'
alias pl='pointfree'
alias p='xclip -o'
alias y='xclip'
alias yy='mpv $(p) --fs --volume=70 --save-position-on-quit'
alias term='konsole &'
alias formats='youtube-dl $(p) -F'
alias ys='mpsyt /'
alias yyl='yy --ytdl-format=136+bestaudio'
alias gd='git diff'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gpl='git pull'
alias gps='git push'
alias gplo='git pull origin'
alias gpso='git push origin'
alias us='setxkbmap us'
alias de='setxkbmap de'
alias esc='setxkbmap -option caps:swapescape'
alias dvp='xmodmap ~/.Xmodmap'
alias h.r='xmodmap ~/.Xmodmap'
alias jeo='xmodmap ~/.Xmodmap'
alias swm='sudo wifi-menu'

# Environment variables

export PATH=$HOME/dotfiles/scripts:$HOME/.local/bin:$PATH

# prompt should really be set in .zpreztorc, but this way, I get the clock from
# paradox with the pure prompt
prompt pure
