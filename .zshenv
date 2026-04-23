# .zshenv is read first in the chain.
#
# It's useful to have things here that need to be available to tools that run
# under non-interactive shells like launchd. Consider $PATH, $EDITOR, $PAGER,
# etc.
#
# Order of execution: .zshenv → .zprofile → .zshrc → .zlogin → .zlogout

export ANDROID_SDK=$HOME/development/Android/sdk
export ANDROID_HOME=$ANDROID_SDK/platform-tools
export FLUTTER_HOME=$HOME/development/flutter

export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

export PATH=$HOME/bin:$HOME/.local/bin:/opt/homebrew/bin/:$FLUTTER_HOME/bin:$ANDROID_SDK/build-tools/36.0.0:$ANDROID_HOME:/opt/homebrew/lib/ruby/gems/3.4.0/bin:/opt/homebrew/opt/ruby/bin:$PATH

