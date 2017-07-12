export SHELL=`which zsh`
[ -z "$ZSH_VERSION" ] && exec "$SHELL" -l

export EDITOR=subl

# export KEYBOARD_LAYOUT="qwerty"
# export BASH_PROMPT_THEME="warm"

export BASH_HIDE_DISTRO=false

# export DEVELPATH="/development"
export COMMAND_LINE_TOOLS_PATH="$HOME/Repos/configs/command-line-tools/clt"

# export PYENV_ROOT="$DEVELPATH/remote/pyenv"
# export RBENV_ROOT="$DEVELPATH/remote/rbenv"
# export LOCAL_APPS="$HOME/.applications/bin"
# export HASKELL_PATHS="$HOME/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.2/bin"
# export GOPATH="$HOME/.applications"

# export PATH=$PYENV_ROOT/bin:$RBENV_ROOT/bin:$LOCAL_APPS:$HASKELL_PATHS:$PATH

# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
# eval "$(rbenv init -)"

source $COMMAND_LINE_TOOLS_PATH/command-line-tools

export ANDROID_HOME=$HOME/Android/Sdk

export PATH=$PATH:$HOME/.cargo/bin::$ANDROID_HOME:$ANDROID_HOME/platforms:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools
export RUST_SRC_PATH=/home/arthur/src/rust/src
