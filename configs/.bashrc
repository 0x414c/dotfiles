#!/usr/bin/env bash

#
# ~/.bashrc
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# ***************************** Pick up system defaults ***********************
function __use_system_bashrc__ {
    # [ -r /etc/bashrc ] && . /etc/bashrc # Not for Arch
    [ -r /etc/bash.bashrc ] && . /etc/bash.bashrc
}
# *****************************************************************************


# ***************************** Add some bash helpers... **********************
function __use_system_helpers__ {
    # [ -r /etc/bash_completion ] && . /etc/bash_completion # Not for Arch
    [ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion || echo "bash_completion not found"
    [ -r /usr/share/doc/pkgfile/command-not-found.bash ] && . /usr/share/doc/pkgfile/command-not-found.bash || echo "command-not-found.bash not found"
    [ -r /usr/share/git/completion/git-completion.bash ] && . /usr/share/git/completion/git-completion.bash || echo "git-completion.bash not found"
    [ -r /usr/share/git/completion/git-prompt.sh ] && . /usr/share/git/completion/git-prompt.sh || echo "git-prompt.sh not found"
}
# *****************************************************************************


# ***************************** And various env vars... ***********************
function __init_env_vars__ {
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
}
# *****************************************************************************


# ***************************** Flavour w/ Bash options... ********************
function __init_shell_opts__ {
    ## NOTE: See `http://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html'
    HISTFILE=$HOME/.bash_history
    HISTFILE2=$HOME/.bash_history-
    HISTFILESIZE=50000
    HISTSIZE=50000
    HISTCONTROL=ignoredups:ignorespace:erasedups
    HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls *:ls'
    IFS=$' \n\t'

    ## NOTE: See `http://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html'
    set -o emacs
    # set -o errexit # for debugging purposes
    set -o monitor
    set -o noclobber
    # set -o nounset # NOTE: unbound vars is present in `bash_completion'
    set -o posix
    set -o pipefail
    # set -o verbose # for debugging purposes
    # set -o xtrace # for debugging purposes

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
}
# *****************************************************************************


# ***************************** And some aliases ... **************************
function __init_aliases__ {
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
    alias ls="ls -hF --color=auto"                # classify files in colour and make sizes human-readable
    alias dir="ls --color=auto --format=vertical"
    alias vdir="ls --color=auto --format=long"
    alias ll="ls -l --color=auto"                 # long list
    alias la="ls -A --color=auto"                 # all but . and ..
    alias lc="ls -C --color=auto"                 # classify + columns
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
    alias gc="git clone"
    alias gl="git log"

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
}
# *****************************************************************************


# ***************************** And some handy funcs... ***********************
function __use_user_helpers__ {
    [ -r $HOME/.bash_helpers ] && . $HOME/.bash_helpers || echo "$HOME/.bash_helpers not found"
}
# *****************************************************************************


# ***************************** And add nifty prompts... **********************
function __init_prompts__ {
    ## Some colors...
    local __rese__="\[\e[0m\]"
    local __cya0__="\[\e[0;49;36m\]"
    local __cya2__="\[\e[7;49;36m\]"
    local __red2__="\[\e[7;49;31m\]"
    local __gre2__="\[\e[7;49;32m\]"
    local __mag1__="\[\e[7;49;35m\]"
    local __mag2__="\[\e[7;107;35m\]"
    local __whi0__="\[\e[0;49;37m\]"
    local __whi2__="\[\e[7;49;37m\]"
    local __yel2__="\[\e[7;49;33m\]"
    local __blu0__="\[\e[0;49;34m\]"
    local __blu1__="\[\e[7;49;34m\]"
    local __blu2__="\[\e[7;107;34m\]"

    ## ...and beautiful chars
    # ─╳→→↪↠↣→⇨↦↬⊕⟴⇛⇻⇉▶▷●◉◆◇○◈☑☒☐➥➥➦➜➞➡➢➣➤➩➯➮➭➲➨➽─━│┃┆┇┊┋▓▒░▞▚┏┗┃▼▽▶▷◀◁▲△╚═╔═✧✦⭆🢂🡆🞉◙🙼🞮🞓🞧🞿🞺🠶🢜🢝🢞🢟⬤⬛⭙🙾

    local __beg__="🙼" # prompt begin
    local __end__="🙼" # prompt end
    local __sta__="" # prompt text start
    local __pra__="" # 1st line start
    local __prb__="" # 2nd line start
    local __arr__="🢂" # arrow
    local __sep__="🙼" # sections separator
    local __ps2__="🠶"
    local __ps3__="🠶"
    local __ps4__="🠶"

    ## If set, the value is interpreted as a command to execute before the printing of each primary prompt
    ## TODO: use Git's PS1
    PROMPT_COMMAND="history -a; echo -en '\a\n'; hr; echo -en '\n\n'; "$PROMPT_COMMAND

    ## PSs
    ## TODO: powerline-style arrows
    PS1="$__rese__$__pra__$__cya0__ $__beg__$__rese__$__cya2__ $__sta__ \D{%F %T} $__sep__$__red2__  \u $__sep__$__gre2__  @\H $__sep__$__mag2__  :\w $__mag1__$__end__$__rese__\n$__rese__$__prb__$__whi0__$__beg__$__rese__$__whi2__ $__sta__ \!:\#:\j:\l $__sep__$__yel2__  \W $__sep__$__blu2__  \$ $__blu1__$__end__$__rese__  "
    PS2="\e[0m\e[7;49;31m$__ps2__ $__end__\e[0m "
    PS3="\e[0m\e[7;49;32m$__ps3__ $__end__\e[0m "
    PS4="\e[0m\e[7;49;34m$__ps4__ $__end__\e[0m "
}
# *****************************************************************************


# *****************************************************************************
__use_system_bashrc__ && unset -f __use_system_bashrc__
__use_system_helpers__ && unset -f __use_helpers__
__use_user_helpers__ && unset -f __use_user_helpers__ && backup_history # && welcome_msg
__init_env_vars__ && unset -f __init_env_vars__
__init_shell_opts__ && unset -f __init_shell_opts__
__init_aliases__ && unset -f __init_aliases__
__init_prompts__ && unset -f __init_prompts__
# *****************************************************************************

# EOF
