# Tmux config

## Set the window name of directories in the bottom bar
Set the following in catppuccin at `~/.config/tmux/plugins/tmux/window`
```bash
text="$(get_tmux_option "@catppuccin_window_current_text" "#W")" # use #W for application instead of directory
```
