if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

function fish_prompt
  
  # Define colors
  set color_cyan (set_color cyan)
  set color_reset (set_color normal)
  set color_blue (set_color blue)
  set color_green (set_color green)

  # Convert anything like /home/noah/Code to ~/Code
  set -g directory (echo $PWD |awk "{ gsub(\"$HOME\", \"~\"); print }")

  # Git repo
  set git_branch (git branch -a 2>/dev/null|grep "*" |sed "s/* //g")

  #set nix_shell (echo $IN_NIX_SHELL)
  if set -q IN_NIX_SHELL
    set nix_shell "($color_blue""nixshell""$color_reset) "
  else
    set nix_shell ""
  end

  # Create the prompt
  if [ $status -eq 0 ]
    echo "$nix_shell""$color_cyan"$USER"$color_reset"@"$color_blue"$hostname"$color_reset":$directory "(""$color_green"$git_branch"$color_reset"")"
  else
    echo "$nix_shell""$color_cyan"$USER"$color_reset"@"$color_blue"$hostname"$color_reset":$directory
  end

  # Add a newline and the prompt symbol
  echo -n -s -e "\$ "

end
