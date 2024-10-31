# no greetings when entering fish just a shell
set fish_greeting

# function to quickly write colored text
function color_text
  set_color "$argv[1]"
  echo -n "$argv[2]"
  set_color "normal"
end

# define the fish prompt
function fish_prompt
  
  # define the color of the user
  if test "$USER" = "root"
    set -f prompt_user (color_text red "$USER")
  else
    set -f prompt_user (color_text cyan "$USER")
  end

  # define @ what will be printed on the terminal
  set -f prompt_machine (color_text blue "machine")

  # convert anything like $HOME/dev to ~/dev
  set -f prompt_directory (echo $PWD |awk "{ gsub(\"$HOME\", \"~\"); print }")

  # vi mode
  set -f prompt_vi " ["(vi_mode_prompt)"]"

  # define the prompt of the git branch
  set -f git_branch (git branch -a 2>/dev/null|grep "*" |sed "s/* //g")
  if test -n "$git_branch"
    set -f prompt_git " ("(color_text green "$git_branch")")"
  end

  # create the prompt
  echo "$prompt_user@$prompt_machine:$prompt_directory$prompt_git$prompt_error$prompt_vi"
  echo -ne '$ '
end
