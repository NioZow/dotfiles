alias ls='eza'
alias vim='nvim'
alias aslr_off='echo 0 | sudo tee /proc/sys/kernel/randomize_va_space'
alias aslr_on='echo 1 | sudo tee /proc/sys/kernel/randomize_va_space'

alias openvpn="sudo /opt/homebrew/opt/openvpn/sbin/openvpn"

# marpit
alias marpit-server-start='docker run --rm -d --init -v $PWD:/home/marp/app/ -e LANG=$LANG -p 37717:37717 -p 8080:8080 marpteam/marp-cli -s .'
alias marpit-pdf='docker run --rm --init -v $PWD:/home/marp/app/ -e LANG=$LANG marpteam/marp-cli --theme theme.css --pdf'
