#!/usr/bin/env bash

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# ***************************** Pick system defaults
# [ -r /etc/bashrc ] && . /etc/bashrc # Not for Arch
[ -r /etc/bash.bashrc ] && . /etc/bash.bashrc


# ***************************** Add some bash helpers...
# [ -r /etc/bash_completion ] && . /etc/bash_completion # Not for Arch
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
[ -r /usr/share/doc/pkgfile/command-not-found.bash ] && . /usr/share/doc/pkgfile/command-not-found.bash
[ -r /usr/share/git/completion/git-completion.bash ] && . /usr/share/git/completion/git-completion.bash


# ***************************** And various env vars...
eval `dircolors -b $HOME/.dir_colors`
# export CLICOLOR=1
# export LSCOLORS=ExFxBxDxCxegedabagacad # Light
# export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx # Dark
# export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd" # Linux
# export LSCOLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:" # Default
export GREP_COLORS="ms=01;31:mc=01;31:sl=:cx=:fn=35:ln=32:bn=32:se=36"
export PAGER="less"
export SYSTEMD_PAGER=$PAGER
if [ -n "$DISPLAY" ]; then export EDITOR="gedit"; else export EDITOR="nano"; fi
if [ -n "$DISPLAY" ]; then export VISUAL="subl3"; else export EDITOR="ne"; fi
if [ -n "$DISPLAY" ]; then export BROWSER="firefox"; else export BROWSER="lynx"; fi
# export GREP_OPTIONS="--color=auto" # Deprecated now
export USE_CCACHE=1


# ***************************** And bash-related options...
HISTFILESIZE=50000
HISTSIZE=50000
HISTCONTROL=ignoredups:ignorespace:erasedups
HISTIGNORE=$"[ \t]*:&:[fb]g:exit:ls"
#HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

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

complete -cf su sudo gksu gksudo kdesu man


# ***************************** With some aliases for frequently used commands...
# Make it shine...
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
[ `command -v colordiff >/dev/null 2>&1` ] && alias diff="colordiff"

# For interactive file operations...
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# Make it human readable by default
alias df="df -h"
alias du="du -h"

# Shortcuts...
alias g="grep"
alias gi="grep -i"
alias t="time"
alias h="history"
alias cls="clear"
alias cex="chmod +x"
alias snn="sudo nano"
alias ssc="sudo systemctl"
alias rscpy="rsync --progress --human-readable --verbose --archive --recursive"
alias gcl="git clone"

# Some shortcuts for different directory listings
alias ls="ls -hF --color=auto"                # classify files in colour
alias dir="ls --color=auto --format=vertical"
alias vdir="ls --color=auto --format=long"
alias ll="ls -l --color=auto"                 # long list
alias la="ls -A --color=auto"                 # all but . and ..
alias lc="ls -CF --color=auto"                # classify + columns
alias l.="ls -d .* --color=auto"              # dotfiles

# Yet another shortcuts...
alias pgs="sudo su - postgres"
alias dtest="python2 ./manage.py runserver"
alias vact="source ./bin/activate"
alias apaclog="tail -f /var/log/apache2/access_log"
alias swatch="bundle exec sass --watch --sourcemap=none ."

alias mkgrub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias mkcpio="sudo mkinitcpio -p linux"

alias bigtmp="sudo mount -o remount,size=4G,noatime /tmp"
alias rfrc=". ~/.bashrc"

alias rsy="repo sync -f -j10"
alias bes=". ./build/envsetup.sh"

alias mshu="sudo shutdown -h -o now"
alias mreb="sudo shutdown -r -o now"
alias shu="sudo shutdown -h now"
alias reb="sudo shutdown -r now"
alias kreb="sudo kexec -l /boot/vmlinuz-linux --initrd=/boot/initramfs-linux.img --reuse-cmdline; sudo kexec -e"

# And don't forget 'bout Pacman...
alias pacupg="sudo pacman -Syu"		# Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias pacin="sudo pacman -S"		# Install specific package(s) from the repositories
alias pacins="sudo pacman -U"		# Install specific package not from the repositories but from a file
alias pacre="sudo pacman -R"		# Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem="sudo pacman -Rns"		# Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep="pacman -Si"		    # Display information about a given package in the repositories
alias pacreps="pacman -Ss"		    # Search for package(s) in the repositories
alias pacloc="pacman -Qi"		    # Display information about a given package in the local database
alias paclocs="pacman -Qs"		    # Search for package(s) in the local database
alias paclo="pacman -Qdt"		    # List all packages which are orphaned
alias pacc="sudo pacman -Scc"		# Clean cache - delete all not currently installed package files
alias paclf="pacman -Ql"		    # List all files installed by a given package
alias pacexpl="pacman -D --asexp"	# Mark one or more installed packages as explicitly installed 
alias pacimpl="pacman -D --asdep"	# Mark one or more installed packages as non explicitly installed

# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="pacman -Qtdq > /dev/null && sudo pacman -Rns \$(pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"

# Additional pacman alias examples
alias pacupd="sudo pacman -Sy && sudo abs"  # Update and refresh the local package and ABS databases against repositories
alias pacinsd="sudo pacman -S --asdeps"     # Install given package(s) as dependencies
alias pacmir="sudo pacman -Syy"             # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
alias pacown="pacman -Qo"                   # Which package owns a file?


# ***************************** Some handy funcs
function note {
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

function extract {
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

function ccc {
        [[ $1 ]]    || { echo "Missing operand" >&2; return 1; }
        [[ -r $1 ]] || { printf "File %s does not exist or is not readable\n" "$1" >&2; return 1; }
	local output_path=${TMPDIR:-/tmp}/${1##*/};
	gcc "$1" -o "$output_path" && "$output_path";
	rm "$output_path";
	return 0;
}

function cmd_exists {
    command -v "$1" >/dev/null 2>&1;
}

function hr {
# "*" "═" "▬" "━"
    command eval "yes '▬' | head -n $COLUMNS | tr -d '\n'"
}


# ***************************** Paint it \e[0;30m...
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


# ***************************** Eye-candy prompts...
# Welcome message pt. I
# command fortune -a | fmt -80 -s | $(shuf -n 1 -e cowsay cowthink) -$(shuf -n 1 -e b d g p s t w y) -f $(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n
# command echo
# command fortune -a | fmt -75 -s | cowsay -n -f tux

# Some colors
__rese__="\[\e[0m\]"
__cya0__="\[\e[0;49;36m\]"
__cya2__="\[\e[7;49;36m\]"
__red2__="\[\e[7;49;31m\]"
__gre2__="\[\e[7;49;32m\]"
__pin1__="\[\e[7;49;35m\]"
__pin2__="\[\e[7;107;35m\]"
__whi0__="\[\e[0;49;37m\]"
__whi2__="\[\e[7;49;37m\]"
__yel2__="\[\e[7;49;33m\]"
__blu0__="\[\e[0;49;34m\]"
__blu1__="\[\e[7;49;34m\]"
__blu2__="\[\e[7;107;34m\]"

# Nifty chars
# ─╳→→↪↠↣→⇨↦↬⊕⟴⇛⇻⇉▶▷●◉◆◇○◈☑☒☐➥➥➦➜➞➡➢➣➤➩➯➮➭➲➨➽─━│┃┆┇┊┋▓▒░▞▚┏┗┃▼▽▶▷◀◁▲△╚═╔═✧✦⭆🢂🡆🞉◙🙼🞮🞓🞧🞿🞺🠶🢜🢝🢞🢟⬤⬛⭙

__beg__="🙼"
__sta__=""
__end__="🙼"
__arr__=" 🢂"
__vse__="🙼"
__pra__=""
__prb__=""
__ps2__="🠶 "
__ps3__="🠶 "
__ps4__="🠶 "

PROMPT_COMMAND="history -a; echo -e '\a'; hr; echo; echo; "$PROMPT_COMMAND

# Welcome message the Second
#command echo -en "$__blu0__  $__beg__$__blu2__ $__sta__ $(uname -a) $__blu1__$__end__$__rese__"

# PSs
# TODO: powerline-style arrows
PS1="$__pra__$__cya0__ $__beg__$__rese__$__cya2__ $__sta__ \D{%F %T} $__vse__$__red2__  \u $__vse__$__gre2__  @\H $__vse__$__pin2__  :\w $__pin1__$__end__$__rese__\n$__prb__$__whi0__$__beg__$__rese__$__whi2__ $__sta__ \!:\#:\j:\l $__vse__$__yel2__  \W $__vse__$__blu2__  \$ $__blu1__$__end__$__rese__\[\a\] $__git_ps1 "
PS2="\e[7;49;94m$__ps2__\e[0m"
PS3="\e[7;49;94m$__ps3__\e[0m"
PS4="\e[7;49;94m$__ps4__\e[0m"
