# Executed for login shells. On OS X, executed every time Terminal.app opens
# a new window.

# Unversioned settings in .extra
for file in ~/.{aliases,bash_prompt,exports,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Keep multiline commands as one command in history
shopt -s cmdhist

# Check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS
shopt -s checkwinsize

# Enable bash completions on linux.
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi


# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring
# wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
complete -W "NSGlobalDomain" defaults

# Colors
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
MAGENTA="$(tput setaf 5)"
CYAN="$(tput setaf 6)"
WHITE="$(tput setaf 7)"
GRAY="$(tput setaf 8)"
BOLD="$(tput bold)"
UNDERLINE="$(tput sgr 0 1)"
INVERT="$(tput sgr 1 0)"
NOCOLOR="$(tput sgr0)"

# OS X uses BSD-style shell coloring.
# Default LSCOLORS=exfxcxdxbxegedabagacad
# The blue for directories is much too dark for a black terminal.
# LSCOLORS chart:
# a black
# b red
# c green
# d brown
# e blue
# f magenta
# g cyan
# h light grey
# A bold black, usually shows up as dark grey
# B bold red
# C bold green
# D bold brown, usually shows up as yellow
# E bold blue
# F bold magenta
# G bold cyan
# H bold light grey; looks like bright white
# x default foreground or background
# 
# Each character pair in the string 'exfxcxdxbxegedabagacad' represents a type
# of file displayed by `ls`. The breakdown of character pairs is:
# 
# 1 (ex) - directories 
# 2 (fx) - symbolic links 
# 3 (cx) - sockets 
# 4 (dx) - pipes 
# 5 (bx) - executable files 
# 6 (eg) - block special 
# 7 (ed) - character special 
# 8 (ab) - executable with setuid bit set 
# 9 (ag) - executable with setgid bit set 
# 10 (ac) - directory writable to others, with sticky bit 
# 11 (ad) - directory writable to others, without sticky bit
# 
# So the default color pairs:
# 
# ex - blue/default - directories
# fx - magenta/default - symbolic links
# cx - green/default - sockets
# dx - brown/default - pipes
# bx - red/default - executable files
# eg - blue/cyan - block special
# ed - blue/brown - character special
# ab - black/red - executable with setuid bit set
# ag - black/cyan - executable with setgid bit set
# ac - black/green - directory writable to others, with sticky bit
# ad - black/brown - directory writable to others, without sticky bit
# 
# This changes the blue for directories to cyan:
export LSCOLORS=gxfxcxdxbxegedabagacad

# $PATH
export PATH="$HOME/bin:$GOROOT/bin:$GOPATH/bin:/usr/local/bin:$PATH"
