# left hand

alias a=$EDITOR # text editor
alias A=$EDITOR # text editor

alias o="htop"  # display htop
alias O="ps ax" # list all processes

alias e="tree -C -L 2"              # list tree
alias E="tree -C -h -L 2 -D -p -g"  # list tree with details

alias u="cv -b" # browse current directory
alias U="cv"    # browse favorites

alias i="ls -Fl"  # list     files
alias I="ls -Fal" # list all files

# right hand

alias d="pushd $HOME" # go to the home directory
alias f="popd $HOME"  # go to the home directory deleting the current one from it

alias h="pushd +1" # go to last directory on history
alias g="popd +1"  # go to last directory on history deleting the current one from it.

alias t="pushd"    # go to argument and add it to history
alias c="pushd .." # go to parent directory and add it to history

alias n="pushd -1" # go to first directory on history
alias r="popd -1"  # go to first directory on history deleting the current one from it

alias s="locate" # search globally for files
alias S="find"   # search locally  for files