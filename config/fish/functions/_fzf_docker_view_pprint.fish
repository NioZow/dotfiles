function _fzf_docker_view_pprint

  set color_red (set_color red)
  set color_normal (set_color normal)

  set -f format '{
    "Command": {
        "Path": "{{.Path}}",
        "Args": {{json .Args}}
    },
    "Ports": {{json .NetworkSettings.Ports}}
  }'

  set -f json (docker inspect --format=$format "$argv[1]" || echo "Cannot preview $argv[1]")

  set -f command (echo $json |jq '.Command.Path')
  set -f command_args (echo $json | jq -r '.Command.Args | join(" ")') 

  set -f ports (echo $json | jq '.Ports')

  echo "> $color_red"Command"$color_normal  : $command $command_args"
  echo "> $color_red"Ports"$color_normal    :"
  echo "$ports" | jq -r 'to_entries[] as $e | $e.value[] | select(.HostIp != "::") | "\(.HostIp):\(.HostPort) => \($e.key)"' | awk '{ printf "  - %-25s\n", $0 }'
end
