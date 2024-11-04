# set the XDG_CONFIG_HOME variable as it does not seem to be set with macos
set -x -U XDG_CONFIG_HOME "$HOME/.config"

# the prompt design
source "$XDG_CONFIG_HOME/fish/source/prompt.fish"

# source aliases
source "$XDG_CONFIG_HOME/fish/source/alias.fish"

# vim configuration, do not source if you do not want to use vim
source "$XDG_CONFIG_HOME/fish/source/vim.fish"

# macos personal variables do not source unless you've got the same setup
source "$XDG_CONFIG_HOME/fish/source/macos.fish"

# exegol related shortcuts only source for exegol
source "$XDG_CONFIG_HOME/fish/source/exegol.fish"
