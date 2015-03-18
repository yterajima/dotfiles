typeset -U path

# export NODEBREW_ROOT="$HOME/.nodebrew"

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# composer
if which composer > /dev/null; then
  export PATH=$HOME/.composer/vendor/bin:$PATH
fi

# Go
if [ -x "`which go`" ]; then
  export GOROOT=`go env GOROOT`
  export GOPATH=$HOME/.go
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi
