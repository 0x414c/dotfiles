#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '


# ***************************** My config starts here...
# export PATH=/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:~/bin:/Volumes/Shared\ Data/Applications/android-sdk-macosx/platform-tools:/Volumes/Shared\ Data/Applications/android-sdk-macosx/tools
export PATH=~/bin:~/opt/bin:$PATH
source /usr/share/doc/pkgfile/command-not-found.bash


# ***************************** Some env. variables...
# export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on' # it should be in .bash_profile
export USE_CCACHE=1
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export GREP_OPTIONS='--color=auto' # confilcts w/android build tools :C
export EDITOR="nano"
export PAGER="less"


# ***************************** And Bash-related options...
HISTFILESIZE=900000
HISTSIZE=900000
HISTCONTROL=ignoreboth:ignoredups:erasedups:ignorespace
HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls'
#HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

complete -cf sudo gksu gksudo kdesu man

shopt -s autocd
shopt -s histappend
shopt -s cdspell
shopt -s cmdhist
shopt -s cdable_vars
shopt -s checkhash
shopt -s direxpand
shopt -s histreedit
shopt -s histverify
shopt -s hostcomplete
shopt -s lithist
shopt -s checkjobs
shopt -s checkwinsize
shopt -s dirspell
# shopt -s dotglob
# shopt -s failglob
# shopt -s nullglob
shopt -s no_empty_cmd_completion

[[ -f /etc/bash_completion ]] && . /etc/bash_completion

# ***************************** With some aliases for frequently used commands...
alias ls="ls --color=auto"
alias diff="colordiff"
alias cls="clear"
alias grep='grep --color'
alias g="grep"
alias gi="grep -i"
alias l="less"
alias t="time"
alias h="history"
alias ex="chmod +x"
alias snn="sudo nano"
alias ssc="sudo systemctl"
alias startsvc="sudo systemctl start"
alias stopsvc="sudo systemctl stop"
alias rscpy="rsync --progress --human-readable --verbose --archive --recursive"
alias kws="sudo killall -HUP WindowServer"
alias rtlrld="sudo kextunload -v 6 -b com.lnx2mac.driver.RealtekRTL81xx && sleep 4 && sudo kextload -v 6 -b com.lnx2mac.driver.RealtekRTL81xx"
alias getrs="wget -v --http-user=admin --http-password=admin http://192.168.1.1/Settings.CFG"
alias pman="man -t $@ | open -f -a /Applications/Preview.app"

alias pgs="sudo su - postgres"
alias dtest="python2 ./manage.py runserver"
alias vact='source ./bin/activate'
alias apaclog="tail -f /var/log/apache2/access_log"
alias swatch="bundle exec sass --watch --sourcemap=none ."

alias mkgrubc="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias mkcpio="sudo mkinitcpio -p linux"

alias mntus="sudo mount -t cifs //192.168.1.2/Users ~/mounts/Users -o user=Alex"
alias cddev="cd /Volumes/Shared\ Data/Extra/Development"
alias bigtmp="sudo mount -o remount,size=4G,noatime /tmp"
alias rfrc="source ~/.bashrc"
alias gcl="git clone"
alias rsy='repo sync -f -j10'
alias bes='. ./build/envsetup.sh'

alias mshu="sudo shutdown -h -o now"
alias mreb="sudo shutdown -r -o now"
alias shu="sudo shutdown -h now"
alias reb="sudo shutdown -r now"
alias kreb="sudo kexec -l /boot/vmlinuz-linux --initrd=/boot/initramfs-linux.img --reuse-cmdline; sudo kexec -e"

alias selfupdate="sudo port selfupdate"
alias selfupgrade="sudo port upgrade outdated"

alias klog="tail -f /var/log/kernel.log"
alias slog="tail -f /var/log/system.log"

# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
#
# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #

# ***************************** And don't forget 'bout Pacman...
alias pacupg='sudo pacman -Syu'		# Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias pacin='sudo pacman -S'		# Install specific package(s) from the repositories
alias pacins='sudo pacman -U'		# Install specific package not from the repositories but from a file 
alias pacre='sudo pacman -R'		# Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem='sudo pacman -Rns'		# Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep='pacman -Si'		# Display information about a given package in the repositories
alias pacreps='pacman -Ss'		# Search for package(s) in the repositories
alias pacloc='pacman -Qi'		# Display information about a given package in the local database
alias paclocs='pacman -Qs'		# Search for package(s) in the local database
alias paclo="pacman -Qdt"		# List all packages which are orphaned
alias pacc="sudo pacman -Scc"		# Clean cache - delete all not currently installed package files
alias paclf="pacman -Ql"		# List all files installed by a given package
alias pacexpl="pacman -D --asexp"	# Mark one or more installed packages as explicitly installed 
alias pacimpl="pacman -D --asdep"	# Mark one or more installed packages as non explicitly installed

# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="pacman -Qtdq > /dev/null && sudo pacman -Rns \$(pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"

# Additional pacman alias examples
alias pacupd='sudo pacman -Sy && sudo abs'         # Update and refresh the local package and ABS databases against repositories
alias pacinsd='sudo pacman -S --asdeps'            # Install given package(s) as dependencies
alias pacmir='sudo pacman -Syy'                    # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist


# ***************************** Paint it... <...>...
# txtblk='\e[0;30m' # Black - Regular
# txtred='\e[0;31m' # Red
# txtgrn='\e[0;32m' # Green
# txtylw='\e[0;33m' # Yellow
# txtblu='\e[0;34m' # Blue
# txtpur='\e[0;35m' # Purple
# txtcyn='\e[0;36m' # Cyan
# txtwht='\e[0;37m' # White
# bldblk='\e[1;30m' # Black - Bold
# bldred='\e[1;31m' # Red
# bldgrn='\e[1;32m' # Green
# bldylw='\e[1;33m' # Yellow
# bldblu='\e[1;34m' # Blue
# bldpur='\e[1;35m' # Purple
# bldcyn='\e[1;36m' # Cyan
# bldwht='\e[1;37m' # White
# unkblk='\e[4;30m' # Black - Underline
# undred='\e[4;31m' # Red
# undgrn='\e[4;32m' # Green
# undylw='\e[4;33m' # Yellow
# undblu='\e[4;34m' # Blue
# undpur='\e[4;35m' # Purple
# undcyn='\e[4;36m' # Cyan
# undwht='\e[4;37m' # White
# bakblk='\e[40m'   # Black - Background
# bakred='\e[41m'   # Red
# bakgrn='\e[42m'   # Green
# bakylw='\e[43m'   # Yellow
# bakblu='\e[44m'   # Blue
# bakpur='\e[45m'   # Purple
# bakcyn='\e[46m'   # Cyan
# bakwht='\e[47m'   # White
# txtrst='\e[0m'    # Text Reset

# # Reset
# Color_Off='\e[0m'       # Text Reset

# # Regular Colors
# Black='\e[0;30m'        # Black
# Red='\e[0;31m'          # Red
# Green='\e[0;32m'        # Green
# Yellow='\e[0;33m'       # Yellow
# Blue='\e[0;34m'         # Blue
# Purple='\e[0;35m'       # Purple
# Cyan='\e[0;36m'         # Cyan
# White='\e[0;37m'        # White

# # Bold
# BBlack='\e[1;30m'       # Black
# BRed='\e[1;31m'         # Red
# BGreen='\e[1;32m'       # Green
# BYellow='\e[1;33m'      # Yellow
# BBlue='\e[1;34m'        # Blue
# BPurple='\e[1;35m'      # Purple
# BCyan='\e[1;36m'        # Cyan
# BWhite='\e[1;37m'       # White

# # Underline
# UBlack='\e[4;30m'       # Black
# URed='\e[4;31m'         # Red
# UGreen='\e[4;32m'       # Green
# UYellow='\e[4;33m'      # Yellow
# UBlue='\e[4;34m'        # Blue
# UPurple='\e[4;35m'      # Purple
# UCyan='\e[4;36m'        # Cyan
# UWhite='\e[4;37m'       # White

# # Background
# On_Black='\e[40m'       # Black
# On_Red='\e[41m'         # Red
# On_Green='\e[42m'       # Green
# On_Yellow='\e[43m'      # Yellow
# On_Blue='\e[44m'        # Blue
# On_Purple='\e[45m'      # Purple
# On_Cyan='\e[46m'        # Cyan
# On_White='\e[47m'       # White

# # High Intensity
# IBlack='\e[0;90m'       # Black
# IRed='\e[0;91m'         # Red
# IGreen='\e[0;92m'       # Green
# IYellow='\e[0;93m'      # Yellow
# IBlue='\e[0;94m'        # Blue
# IPurple='\e[0;95m'      # Purple
# ICyan='\e[0;96m'        # Cyan
# IWhite='\e[0;97m'       # White

# # Bold High Intensity
# BIBlack='\e[1;90m'      # Black
# BIRed='\e[1;91m'        # Red
# BIGreen='\e[1;92m'      # Green
# BIYellow='\e[1;93m'     # Yellow
# BIBlue='\e[1;94m'       # Blue
# BIPurple='\e[1;95m'     # Purple
# BICyan='\e[1;96m'       # Cyan
# BIWhite='\e[1;97m'      # White

# # High Intensity backgrounds
# On_IBlack='\e[0;100m'   # Black
# On_IRed='\e[0;101m'     # Red
# On_IGreen='\e[0;102m'   # Green
# On_IYellow='\e[0;103m'  # Yellow
# On_IBlue='\e[0;104m'    # Blue
# On_IPurple='\e[0;105m'  # Purple
# On_ICyan='\e[0;106m'    # Cyan
# On_IWhite='\e[0;107m'   # White


# ***************************** Some handy funcs
note() {
    # if file doesn't exist, create it
    if [[ ! -f $HOME/.notes ]]; then
        touch "$HOME/.notes"
    fi

    if ! (($#)); then
        # no arguments, print file
        cat "$HOME/.notes"
    elif [[ "$1" == "-c" ]]; then
        # clear file
        > "$HOME/.notes"
    else
        # add all arguments to file
        printf "%s\n" "$*" >> "$HOME/.notes"
    fi
}

extract() {
    local c e i

    (($#)) || return

    for i; do
        c=''
        e=1

        if [[ ! -r $i ]]; then
            echo "$0: file is unreadable: \`$i'" >&2
            continue
        fi

        case $i in
            *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
                   c=(bsdtar xvf);;
            *.7z)  c=(7z x);;
            *.Z)   c=(uncompress);;
            *.bz2) c=(bunzip2);;
            *.exe) c=(cabextract);;
            *.gz)  c=(gunzip);;
            *.rar) c=(unrar x);;
            *.xz)  c=(unxz);;
            *.zip) c=(unzip);;
            *)     echo "$0: unrecognized file extension: \`$i'" >&2
                   continue;;
        esac

        command "${c[@]}" "$i"
        ((e = e || $?))
    done
    return "$e"
}

csource() {
        [[ $1 ]]    || { echo "Missing operand" >&2; return 1; }
        [[ -r $1 ]] || { printf "File %s does not exist or is not readable\n" "$1" >&2; return 1; }
	local output_path=${TMPDIR:-/tmp}/${1##*/};
	gcc "$1" -o "$output_path" && "$output_path";
	rm "$output_path";
	return 0;
}


# ***************************** Eye-candy prompts
# screenfetch
# uname -a | cowsay
# cowsay -f /usr/share/cows/sheep.cow $(uname -a)
# cowsay -f /usr/share/cows/sheep.cow $(fortune)
# command fortune -a | fmt -80 -s | $(shuf -n 1 -e cowsay cowthink) -$(shuf -n 1 -e b d g p s t w y) -f $(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n

# ─╳→→↪↠↣→⇨↦↬⊕⟴⇛⇻⇉▶▷●◉◆◇○◈☑☒☐➥➥➦➜➞➡➢➣➤➩➯➮➭➲➨➽─━│┃┆┇┊┋▓▒░▞▚┏┗┃▼▽▶▷◀◁▲△╚═╔═✧✦⭆🢂🡆🞉◙🙼🞮🞓🞧🞿🞺🠶🢜🢝🢞🢟⬤⬛⭙

# sep__="═"
# sep__="▬"
# sep__="━"
# sepl__=`echo -en "$(yes "$sep__" | head -n "${COLUMNS}" | tr -d '\n')\r"`
# rv__="☐"

# st__="▓▒░"
# en__="░▒▓"
beg__="🙼"
st__=""
en__="🙼"
# ar__="≡►"
ar__=" 🢂"
vs__="🙼"
# pra__="╔══"
# prb__="╚══"
pra__=""
prb__=""
ps2__="🠶 "
ps3__="🠶 "
ps4__="🠶 "

# st__="▓▒░"
# en__="░▒▓"
# ar__="➡"
# vs__="┇"
# pra__="┏═━"
# prb__="┗═━"
# ps2__="⇛ "
# ps3__="⇉ "
# ps4__="⊕ "

# PROMPT_COMMAND='RET=$?; if [[ $RET -eq 0 ]]; then echo -ne "\e[32m$RET\e[0m ;)"; else echo -ne "\e[31m$RET\e[0m ;("; fi; echo -n " "'
# PROMPT_COMMAND="rv__=`if [[ $? == 0 ]]; then echo '☑'; else echo '☐'; fi;`"

#PROMPT_COMMAND="echo -ne "\033]0;SOME TITLE HERE\007"; history -a; echo; echo -n $sepl__"
#PROMPT_COMMAND="printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}""
# PROMPT_COMMAND=$PROMPT_COMMAND"; history -a; echo; echo -n $sepl__"
PROMPT_COMMAND="history -a; echo; "$PROMPT_COMMAND
#wget URL && notify-send "Done" || notify-send "Failed"

# echo -en "$BBlue"$(( $(sed -nu "s/MemFree:[\t ]\+\([0-9]\+\) kB/\1/p" /proc/meminfo)/1024))"$Blue/"$(($(sed -nu "s/MemTotal:[\t ]\+\([0-9]\+\) kB/\1/Ip" /proc/meminfo)/1024 ))MB"\t$BRed$(< /proc/loadavg)\033[m"

reset__="\[\e[0m\]"
cyan0__="\[\e[0;49;36m\]"
cyanbg__="\[\e[7;49;36m\]"
redbg__="\[\e[7;49;31m\]"
greenbg__="\[\e[7;49;32m\]"
pink1__="\[\e[7;49;35m\]"
pinkbg__="\[\e[7;107;35m\]"
white0__="\[\e[0;49;37m\]"
whitebg__="\[\e[7;49;37m\]"
yelbg__="\[\e[7;49;33m\]"
blu0__="\[\e[0;49;34m\]"
blu1__="\[\e[7;49;34m\]"
blubg__="\[\e[7;107;34m\]"

echo -en "\e[0;49;34m  $beg__\e[7;107;34m $st__ $(uname -a) \e[7;49;34m$en__\e[0m"

# TODO: powerline-style arrows
PS1="$pra__$cyan0__ $beg__$reset__$cyanbg__ $st__ \D{%F %T} $vs__$redbg__  \u $vs__$greenbg__  @\H $vs__$pinkbg__  :\w $pink1__$en__$reset__\n$prb__$white0__$beg__$reset__$whitebg__ $st__ \!:\#:\j:\l $vs__$yelbg__  \W $vs__$blubg__  \$ $blu1__$en__$reset__\[\a\] "
PS2="\e[7;49;94m$ps2__\e[0m"
PS3="\e[7;49;94m$ps3__\e[0m"
PS4="\e[7;49;94m$ps4__\e[0m"


##
# Your previous /Users/Alex/.bash_profile file was backed up as /Users/Alex/.bash_profile.macports-saved_2012-08-17_at_02:28:35
##

# MacPorts Installer addition on 2012-08-17_at_02:28:35: adding an appropriate PATH variable for use with MacPorts.
# export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
