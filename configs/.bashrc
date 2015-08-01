#!/usr/bin/env bash

#
# ~/.bashrc
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# ***************************** Pick up system defaults ***********************
# [ -r /etc/bashrc ] && . /etc/bashrc # Not for Arch
[ -r /etc/bash.bashrc ] && . /etc/bash.bashrc
# *****************************************************************************


# ***************************** Add some bash helpers... **********************
# [ -r /etc/bash_completion ] && . /etc/bash_completion # Not for Arch
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
[ -r /usr/share/doc/pkgfile/command-not-found.bash ] && . /usr/share/doc/pkgfile/command-not-found.bash
[ -r /usr/share/git/completion/git-completion.bash ] && . /usr/share/git/completion/git-completion.bash
[ -r /usr/share/git/completion/git-prompt.sh ] && . /usr/share/git/completion/git-prompt.sh
# *****************************************************************************


# ***************************** And various env vars... ***********************
## Use ANSI color sequences to distinguish file types
export CLICOLOR=1
## NOTE: `LS_COLORS' is for GNU Coreutils, `LSCOLORS' is for BSD Coreutils
## Set `LS_COLORS' using `.dir_colors' file contents
# eval `dircolors -b $HOME/.dir_colors` 
## Or use precomputed values
# export LS_COLORS=ExFxBxDxCxegedabagacad # Light
# export LS_COLORS=gxBxhxDxfxhxhxhxhxcxcx # Dark
# export LS_COLORS="ExGxBxDxCxEgEdxbxgxcxd" # Linux default?
export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:" # Default

## If the `listlinks' is set, `ls -F' will identify symbolic links in more detail
export LISTLINKS=1

## This specifies the default block size for all values that are normally printed as blocks
export BLOCKSIZE=1KiB

## This variable specifies the colors and other attributes used to highlight various parts of the output
export GREP_COLORS="ms=01;31:mc=01;31:sl=:cx=:fn=35:ln=32:bn=32:se=36"

## Options (for `less', ofc) are also taken from the environment variable `LESS'
export LESS="CFR"

## Contains command to run the program used to list the contents of files
## The pager called by man and other such programs when you tell them to view a file
export PAGER="less"
export SYSTEMD_PAGER=$PAGER

## Contains the command to run the lightweight program used for editing files
## The editor program called by `sudoedit', `vipw', and other such programs when you tell them to edit a file
if [ -n "$DISPLAY" ]; then export EDITOR="gedit"; else export EDITOR="nano"; fi

## Contains command to run the full-fledged editor that is used for more demanding tasks
## Many programs, including `less' and `crontab', will invoke VISUAL to edit a file, falling back to `EDITOR' if `VISUAL' is not set - but others invoke `EDITOR' directly
if [ -n "$DISPLAY" ]; then export VISUAL="subl3"; else export EDITOR="ne"; fi

## Contains the path to the web browser
if [ -n "$DISPLAY" ]; then export BROWSER="firefox"; else export BROWSER="lynx"; fi

#export USE_CCACHE=1
# *****************************************************************************


# ***************************** Flavour w/ Bash options... ********************
## NOTE: See `http://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html'
HISTFILE=$HOME/.bash_history
HISTFILE2=$HOME/.bash_history-
HISTFILESIZE=50000
HISTSIZE=50000
HISTCONTROL=ignoredups:ignorespace:erasedups
HISTIGNORE=$"[ \t]*:&:[fb]g:exit:ls *:ls"

## Make history backup
[ ! -f $HISTFILE ] && touch $HISTFILE
[ ! -f $HISTFILE2 ] && touch $HISTFILE2
cp $HISTFILE $HISTFILE2 1>/dev/null 2>&1

## NOTE: See `http://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html'
set -o emacs
set -o monitor
set -o noclobber
# set -o nounset # NOTE: unbound vars is present in `bash_completion'
set -o posix
# set -o xtrace # for debugging purposes
# set -o verbose # for debugging purposes

## NOTE: See `http://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html'
shopt -s autocd
shopt -s cdable_vars
shopt -s cdspell
shopt -s checkhash
shopt -s checkjobs
shopt -s checkwinsize
shopt -s cmdhist
shopt -s complete_fullquote
shopt -s direxpand
shopt -s dirspell
# shopt -s dotglob
# shopt -s expand_aliases
shopt -s extglob
# shopt -s failglob
shopt -s globstar
shopt -s gnu_errfmt
shopt -s histappend
shopt -s histreedit
shopt -s histverify
shopt -s hostcomplete
shopt -s huponexit
# shopt -s interactive_comments
shopt -s lithist
shopt -s no_empty_cmd_completion
# shopt -s nullglob
# shopt -s progcomp
# shopt -s promptvars
# shopt -s shift_verbose
# shopt -s xpg_echo

complete -cf su sudo gksu gksudo kdesu man
# *****************************************************************************


# ***************************** And some aliases ... **************************
## Make it shine...
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
[ `command -v colordiff 1>/dev/null 2>&1` ] && alias diff="colordiff"

## For interactive & verbose file operations...
alias rm="rm -iv"
alias cp="cp -iv"
alias mv="mv -iv"

## Make it human readable by default
alias df="df -h"
alias du="du -h"

## Some shortcuts for different directory listings
alias ls="ls -hF --color=auto"                # classify files in colour
alias dir="ls --color=auto --format=vertical"
alias vdir="ls --color=auto --format=long"
alias ll="ls -l --color=auto"                 # long list
alias la="ls -A --color=auto"                 # all but . and ..
alias lc="ls -CF --color=auto"                # classify + columns
alias l.="ls -d .* --color=auto"              # dotfiles
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less' # full recursive directory listing

## Make some commands more comfortable to use
alias mkdir="mkdir -pv"
alias ..="cd ./../"
alias ....="cd ./../../"

## Shortcuts...
alias g="grep"
alias gi="grep -i"
alias t="time"
alias h="history"
alias cls="clear"
alias cmx="chmod +x"
alias snn="sudo nano"
alias ssc="sudo systemctl"
alias rscpy="rsync --progress --human-readable --verbose --archive --recursive"
alias gcl="git clone"

## Yet another shortcuts...
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

alias shu="sudo shutdown -h now"
alias reb="sudo shutdown -r now"
alias kreb="sudo kexec -l /boot/vmlinuz-linux --initrd=/boot/initramfs-linux.img --reuse-cmdline; sudo kexec -e"

## And don't forget 'bout Pacman...
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

## For recursively removing orphans and their configuration files
alias pacro="sudo pacman -Rns \$(pacman -Qtdq)"
# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro2="pacman -Qtdq 1>/dev/null && sudo pacman -Rns \$(pacman -Qtdq | sed -e ':a;N;\$!ba;s/\n/ /g')"

## Additional pacman alias examples
alias pacupd="sudo pacman -Sy && sudo abs"  # Update and refresh the local package and ABS databases against repositories
alias pacinsd="sudo pacman -S --asdeps"     # Install given package(s) as dependencies
alias pacmir="sudo pacman -Syy"             # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
alias pacown="pacman -Qo"                   # Which package owns a file?
alias pacopt="sudo pacman -Sc && sudo pacman-optimize" # Optimize
# *****************************************************************************


# ***************************** And some handy funcs... ***********************
## Takes a note
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
        >| "$HOME/.notes"
    else
        # add all arguments to file
        printf "%s\n" "$*" >> "$HOME/.notes"
    fi
}

## Extracts an archive
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

## Compiles source file w/ GCC
function ccc {
        [[ $1 ]]    || { echo "Missing operand" >&2; return 1; }
        [[ -r $1 ]] || { printf "File %s does not exist or is not readable\n" "$1" >&2; return 1; }
	local output_path=${TMPDIR:-/tmp}/${1##*/};
	gcc "$1" -o "$output_path" && "$output_path";
	rm "$output_path";
	
    return 0;
}

## Checks if particular command exists in the system
function cmd_exists {
    command -pv "$1" >/dev/null 2>&1;
}

## Prints horizontal separator line
function hr {
## "*" "═" "▬" "━"
    command yes '━' 2>/dev/null | head -n $COLUMNS | tr -d '\n'
}

## Search manpage given in argument `1' for term given in argument `2' (case insensitive)
## displays paginated result with colored search terms and two lines surrounding each hit
function manf {
    command man $1 | grep -iC2 $2 | less
}

## Makes a new dir and cds into it
function mkcd {
    command mkdir -pv "$1" && cd "$1";
}
# *****************************************************************************


# ***************************** Paint it \e[0;30m... **************************
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


## Reset
# Color_Off='\e[0m'       # Text Reset

## Regular Colors
# Black='\e[0;30m'        # Black
# Red='\e[0;31m'          # Red
# Green='\e[0;32m'        # Green
# Yellow='\e[0;33m'       # Yellow
# Blue='\e[0;34m'         # Blue
# Purple='\e[0;35m'       # Purple
# Cyan='\e[0;36m'         # Cyan
# White='\e[0;37m'        # White

## Bold
# BBlack='\e[1;30m'       # Black
# BRed='\e[1;31m'         # Red
# BGreen='\e[1;32m'       # Green
# BYellow='\e[1;33m'      # Yellow
# BBlue='\e[1;34m'        # Blue
# BPurple='\e[1;35m'      # Purple
# BCyan='\e[1;36m'        # Cyan
# BWhite='\e[1;37m'       # White

## Underline
# UBlack='\e[4;30m'       # Black
# URed='\e[4;31m'         # Red
# UGreen='\e[4;32m'       # Green
# UYellow='\e[4;33m'      # Yellow
# UBlue='\e[4;34m'        # Blue
# UPurple='\e[4;35m'      # Purple
# UCyan='\e[4;36m'        # Cyan
# UWhite='\e[4;37m'       # White

## Background
# On_Black='\e[40m'       # Black
# On_Red='\e[41m'         # Red
# On_Green='\e[42m'       # Green
# On_Yellow='\e[43m'      # Yellow
# On_Blue='\e[44m'        # Blue
# On_Purple='\e[45m'      # Purple
# On_Cyan='\e[46m'        # Cyan
# On_White='\e[47m'       # White

## High Intensity
# IBlack='\e[0;90m'       # Black
# IRed='\e[0;91m'         # Red
# IGreen='\e[0;92m'       # Green
# IYellow='\e[0;93m'      # Yellow
# IBlue='\e[0;94m'        # Blue
# IPurple='\e[0;95m'      # Purple
# ICyan='\e[0;96m'        # Cyan
# IWhite='\e[0;97m'       # White

## Bold High Intensity
# BIBlack='\e[1;90m'      # Black
# BIRed='\e[1;91m'        # Red
# BIGreen='\e[1;92m'      # Green
# BIYellow='\e[1;93m'     # Yellow
# BIBlue='\e[1;94m'       # Blue
# BIPurple='\e[1;95m'     # Purple
# BICyan='\e[1;96m'       # Cyan
# BIWhite='\e[1;97m'      # White

## High Intensity backgrounds
# On_IBlack='\e[0;100m'   # Black
# On_IRed='\e[0;101m'     # Red
# On_IGreen='\e[0;102m'   # Green
# On_IYellow='\e[0;103m'  # Yellow
# On_IBlue='\e[0;104m'    # Blue
# On_IPurple='\e[0;105m'  # Purple
# On_ICyan='\e[0;106m'    # Cyan
# On_IWhite='\e[0;107m'   # White
# *****************************************************************************


# ***************************** And add nifty prompts... **********************
function __make_prompts__ {
    ## Welcome message pt. I
    # command fortune -a | fmt -80 -s | $(shuf -n 1 -e cowsay cowthink) -$(shuf -n 1 -e b d g p s t w y) -f $(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n
    # command echo -en '\n'
    command fortune -a | fmt -75 -s | cowsay -n -f tux
    # command echo -en '\n'

    ## Some colors...
    local __rese__="\[\e[0m\]"
    local __cya0__="\[\e[0;49;36m\]"
    local __cya2__="\[\e[7;49;36m\]"
    local __red2__="\[\e[7;49;31m\]"
    local __gre2__="\[\e[7;49;32m\]"
    local __pin1__="\[\e[7;49;35m\]"
    local __pin2__="\[\e[7;107;35m\]"
    local __whi0__="\[\e[0;49;37m\]"
    local __whi2__="\[\e[7;49;37m\]"
    local __yel2__="\[\e[7;49;33m\]"
    local __blu0__="\[\e[0;49;34m\]"
    local __blu1__="\[\e[7;49;34m\]"
    local __blu2__="\[\e[7;107;34m\]"

    ## ...and beautiful chars
    # ─╳→→↪↠↣→⇨↦↬⊕⟴⇛⇻⇉▶▷●◉◆◇○◈☑☒☐➥➥➦➜➞➡➢➣➤➩➯➮➭➲➨➽─━│┃┆┇┊┋▓▒░▞▚┏┗┃▼▽▶▷◀◁▲△╚═╔═✧✦⭆🢂🡆🞉◙🙼🞮🞓🞧🞿🞺🠶🢜🢝🢞🢟⬤⬛⭙🙾

    local __beg__="🙼"
    local __sta__=""
    local __end__="🙼"
    local __arr__=" 🢂"
    local __vse__="🙼"
    local __pra__=""
    local __prb__=""
    local __ps2__="🠶 "
    local __ps3__="🠶 "
    local __ps4__="🠶 "

    ## Welcome message the Second
    ## TODO: outdated & not working
    # command echo -en "$__rese__$__blu0__  $__beg__$__blu2__ $__sta__ $(uname -a) $__blu1__$__end__$__rese__"

    ## If set, the value is interpreted as a command to execute before the printing of each primary prompt
    ## TODO: use Git's PS1
    PROMPT_COMMAND="history -a; echo -en '\a\n'; hr; echo -en '\n\n'; "$PROMPT_COMMAND

    ## PSs
    ## TODO: powerline-style arrows
    PS1="$__rese__$__pra__$__cya0__ $__beg__$__rese__$__cya2__ $__sta__ \D{%F %T} $__vse__$__red2__  \u $__vse__$__gre2__  @\H $__vse__$__pin2__  :\w $__pin1__$__end__$__rese__\n$__rese__$__prb__$__whi0__$__beg__$__rese__$__whi2__ $__sta__ \!:\#:\j:\l $__vse__$__yel2__  \W $__vse__$__blu2__  \$ $__blu1__$__end__$__rese__\[\a\]  "
    PS2="\e[7;49;94m$__ps2__\e[0m"
    PS3="\e[7;49;94m$__ps3__\e[0m"
    PS4="\e[7;49;94m$__ps4__\e[0m"
}

__make_prompts__
# *****************************************************************************
