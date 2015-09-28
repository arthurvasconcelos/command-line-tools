# left hand

alias a=$EDITOR # text editor
alias A=$EDITOR # text editor

alias s="htop"  # display htop
alias S="ps ax" # list all processes

alias d="tree -C -L 2"              # list tree
alias D="tree -C -h -L 2 -D -p -g"  # list tree with details

alias f="cv -b" # browse current directory
alias F="cv"    # browse favorites

alias g="ls -Fl"  # list     files
alias G="ls -Fal" # list all files

# right hand

alias h="pushd $HOME" # go to the home directory
alias y="popd $HOME"  # go to the home directory deleting the current one from it

alias j="pushd +1" # go to last directory on history
alias u="popd +1"  # go to last directory on history deleting the current one from it.

alias k="pushd"    # go to argument and add it to history
alias i="pushd .." # go to parent directory and add it to history

alias l="pushd -1" # go to first directory on history
alias o="popd -1"  # go to first directory on history deleting the current one from it

alias ç="locate" # search globally for files
alias Ç="find"   # search locally  for files