# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias rg='rg --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# -------------------- dotfiles vim / bash fanatic aliases --------------------

# alias svim="sudo vim"
alias c='clear'
alias ed='$EDITOR'
if [ -x /usr/bin/bat ]; then
	alias vw='bat'
fi
if [ -x /usr/bin/bat ]; then
  alias vw='bat'
elif [ -x /usr/bin/batcat ]; then
  alias vw='batcat'
else
  echo "bat not found!"
fi

alias git-u='git config --list | rg user'
# alias vimvim="vim ~/.vimrc"
# alias vimbashrc="vim ~/.bashrc"
# alias vimalias="vim ~/.bash_aliases"
# alias rebashrc=". ~/.bashrc"
# alias realias=". ~/.bash_aliases"

# -------------------- other various unclassfied aliases -------------------

# alias semaine='date +%V'
# alias ifif='sudo ifdown wlan0 && sudo ifup wlan0'
alias screencast='ffmpeg -f x11grab -r 25 -s wxga -i :0.0 /tmp/outputFile.mpg'
alias whereisraspberrypi="sudo nmap -sV --open 192.168.1.0/25 -p22"
alias allIps='for ip in $(seq 1 254); do ping -c 1 192.168.1.$ip>/dev/null; [ $? -eq 0 ] && echo "192.168.1.$ip UP" || : ; done'
# Add an "alert" alias for long running commands.  Use like so:
# #   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias wtf='tail -f /var/log/{dmesg,messages,*{,/*}{log,err}}'

# -------------------- network-related aliases -------------------

# IP addresses
# alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
# curl checkip.amazonaws.com
# curl ifconfig.me
# curl icanhazip.com
# curl ipecho.net/plain
# curl ifconfig.co
alias ip="curl checkip.amazonaws.com"

# Enhanced WHOIS lookups
# alias whois="whois -h whois-servers.net"
# View HTTP traffic
alias sniff="sudo ngrep -d 'eth1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en3 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias httpsniff="sudo tcpdump -A -s0 -ien3 port 80"
alias httpsniff2="sudo tcpdump -A -s0 -ien0 port 80"

# -------------------- Personal aliases -------------------
