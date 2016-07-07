PATH=/opt/local/bin:$PATH
export PATH="$HOME/.node_modules_global/bin:$PATH"

#if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
#else
  #export TERM='xterm-color'
#fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
