function _fzf_search_docker --description "Search all running docker."

    # docker full path
    set -f docker_cmd (command -v docker || echo "docker")

    # use all caps to be consistent with ps default format
    # snake_case because ps doesn't seem to allow spaces in the field names
    set -f ps_preview_fmt (string join ',' 'container id=id' 'image' 'command' 'created')
    set -f processes_selected (
        $docker_cmd ps | \
        _fzf_wrapper --multi \
                    --prompt="Docker> " \
                    --query (commandline --current-token) \
                    --ansi -e -i \
                    # first line outputted by ps is a header, so we need to mark it as so
                    --header-lines=1 \
                    # ps uses exit code 1 if the process was not found, in which case show an message explaining so
                    --preview="_fzf_docker_view_pprint {1}" \
                    --preview-window="bottom:8:wrap" \
                    $fzf_processes_opts
    )

    # just a copy and paste from _fzf_search_processes
    # too lazy to change it cuz it just works
    if test $status -eq 0
        for process in $processes_selected
            set -f --append pids_selected (string split --no-empty --field=1 -- " " $process)
        end

        # string join to replace the newlines outputted by string split with spaces
        commandline --current-token --replace -- (string join ' ' $pids_selected)
    end

    commandline --function repaint
end
