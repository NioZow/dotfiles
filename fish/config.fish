# set the XDG_CONFIG_HOME variable as it does not seem to be set with macos
set -x -U XDG_CONFIG_HOME "$HOME/.config"

# source other fish configuration files
source "$XDG_CONFIG_HOME/fish/source/vars.fish"
source "$XDG_CONFIG_HOME/fish/source/alias.fish"
source "$XDG_CONFIG_HOME/fish/source/vim.fish"
source "$XDG_CONFIG_HOME/fish/source/prompt.fish"
#source "$XDG_CONFIG_HOME/fish/fzf.fish"
