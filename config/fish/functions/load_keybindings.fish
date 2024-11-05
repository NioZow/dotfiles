function load_keybindings --description "load fzf keybindings"
  # search for a command in the history using ctrl+r
  bind -M insert \cr _fzf_search_history
  bind -M normal \cr _fzf_search_history

  # search for a process (and return pid) using ctrl+p
  bind -M normal \cp _fzf_search_processes
  bind -M insert \cp _fzf_search_processes

  # search for a file with preview using ctrl+f
  bind -M normal \cf _fzf_search_directory
  bind -M insert \cf _fzf_search_directory

  # search for a file with preview using ctrl+f
  bind -M normal \co $_fzf_search_vars_command
  bind -M insert \co $_fzf_search_vars_command

  # docker containers
  bind -M insert \cd _fzf_search_docker
  bind \cd _fzf_search_docker
  bind -M visual \cd _fzf_search_docker
end
