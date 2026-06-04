export EDITOR="vi"
export GOPRIVATE="github.com/quinyx/*"
export CDPATH="$HOME/FilesystemBookmarks"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin"

# zsh equivalents of bash HISTCONTROL=ignoreboth
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
