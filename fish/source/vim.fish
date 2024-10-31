set -g fish_key_bindings fish_vi_key_bindings

function vi_mode_prompt

  set -f text "$fish_bind_mode"
  set -f color red

  switch $fish_bind_mode
    case default
      set_color --bold red
      set text "normal"
    case insert
      set_color --bold green
    case replace_one
      set_color --bold green
    case visual
      set_color --bold brmagenta
  end

  set color --bold red
  echo -n (string upper "$text")
  set_color normal
end

function fish_user_key_bindings
  fish_vi_key_bindings

  function fzf_search_file
    set file (find . | fzf -e -i --tmux)
    if test -n "$file"
        commandline -i "$file"
    end
  end

  function fzf_search_history
    set command (history | fzf -e -i --tmux)
    if test -n "$command"
        commandline -i "$command"
    end
  end

  # search for a command in the history using ctrl+r
  bind -M insert \cr _fzf_search_history
  bind -M normal \cr _fzf_search_history

  # search for a process (and return pid) using ctrl+p
  bind -M normal \cp _fzf_search_processes
  bind -M insert \cp _fzf_search_processes

  # search for a file with preview using ctrl+f
  bind -M normal \cf _fzf_search_directory
  bind -M insert \cf _fzf_search_directory
end

# remove vi mode prompt to set it manually and customize it
function fish_mode_prompt; end
