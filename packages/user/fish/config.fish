# XDG Config
set -xg XDG_CONFIG_HOME $HOME/.config
set -xg XDG_CACHE_HOME $HOME/.cache
set -xg XDG_DATA_HOME $HOME/.local/share
set PATH $XDG_DATA_HOME/bin $PATH
set PATH $HOME/.local/bin $PATH

# NPM
set -xg NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -xg NPM_CONFIG_PREFIX $XDG_CONFIG_HOME/npm/global
set PATH $NPM_CONFIG_PREFIX/bin $PATH

# TERMINAL
set -xg TERMINAL xterm-color