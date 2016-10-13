# based on debian 9-testing's default user .bash_aliases
# accompanied by https://github.com/divinity76/bashrc/blob/master/.bashrc
alias grep='grep --color=auto'
#alias fgrep='fgrep --color=auto'
#alias egrep='egrep --color=auto'
alias ls='ls --color=auto'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'
# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

alias path='echo -e ${PATH//:/\\n}'
alias dfh='df -h'
# alias syslog='sudo tail -100f /var/log/syslog'


# perform 'ls' after 'cd' if successful.
cdls() {
  builtin cd "$*"
  RESULT=$?
  if [ "$RESULT" -eq 0 ]; then
    ls
  fi
}
alias cd='cdls'
alias startvnc='x11vnc -auth /var/run/lightdm/root/:0 -display :0'
# allows `su www-data` to run as /bin/bash , because the default shell is /bin/false, disabling shell access to www-data 
su() {
    if [[ $@ == "www-data" ]]; then
        command su www-data -s /bin/bash
    else
        command su "$@"
    fi
}
isscreen(){
    if test -n "$STY"; then 
        printf "$STY\n"; 
    else 
        printf "This is NOT a screen session.\n";
    fi
}
alias dropcaches='echo 3 > /proc/sys/vm/drop_caches'
syncdropcaches(){
    printf "syncing... ";
    sync
    printf "synced. dropping... "
    echo 3 > /proc/sys/vm/drop_caches
    printf "dropped.\n"
}
alias traceroute='traceroute --max-hops=255'
