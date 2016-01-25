#!/usr/bin/env bash

#
# ~/.bashrc
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## Tries to `source' all the files whose
## names provided as function arguments
## USAGE: __include__ [FILE1 [FILE2...]]
## Return codes:
## `2' if one or more files is not readable,
## `1' if no args provided
## `0' if all the provided files was successfully sourced
function __source__ {
    [[ -z "$@" ]] && return 1

    local retcode=0

    for file in "$@"
        do 
            if [[ -r "$file" ]]; then
                source "$file"
				retcode=$?
            else 
                echo '__include__: not readable: '$file
                retcode=2
            fi
        done

    return $retcode
}


# ***************************** Pick up system defaults ***********************
function __use_system_bashrc__ {
    __source__ '/etc/bash.bashrc'
}
# *****************************************************************************


# ***************************** And some handy funcs... ***********************
function __use_user_helpers__ {
    __source__ $HOME'/.bash_helpers'
}
# *****************************************************************************


# ***************************** Add some bash helpers... **********************
function __use_system_helpers__ {
    __source__ '/usr/share/bash-completion/bash_completion' '/usr/share/doc/pkgfile/command-not-found.bash' '/usr/share/git/completion/git-completion.bash' '/usr/share/git/completion/git-prompt.sh'
    
    ## Configure Git prompt
    ## NOTE: For variables descriptions see comments in `git-prompt.sh'
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWSTASHSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWUPSTREAM='name'
    GIT_PS1_STATESEPARATOR=':'
    GIT_PS1_DESCRIBE_STYLE='default'
    GIT_PS1_SHOWCOLORHINTS=1
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
    export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:' # Default

    ## Colorize GCC output
    ## NOTE: See `http://gcc.gnu.org/onlinedocs/gcc-4.9.0/gcc/Language-Independent-Options.html#index-fdiagnostics-color-252'
    export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

    ## If the `listlinks' is set, `ls -F' will identify symbolic links in more detail
    export LISTLINKS=1

    ## This specifies the default block size for all values that are normally printed as blocks
    export BLOCKSIZE='1KiB'

    ## This variable specifies the colors and other attributes used to highlight various parts of the output
    export GREP_COLORS='ms=01;31:mc=01;31:sl=:cx=:fn=35:ln=32:bn=32:se=36'

    ## Options (for `less', ofc) are also taken from the environment variable `LESS'
    export LESS='CR'

    ## Contains command to run the program used to list the contents of files
    ## The pager called by man and other such programs when you tell them to view a file
    export PAGER='less'
    export SYSTEMD_PAGER=$PAGER
    # export VIEWER="most"
    # export MANPAGER=$PAGER

    ## Location of `readline' config file
    export INPUTRC=$HOME'/.inputrc'

	## `ccache' configuration
    export USE_CCACHE=1 
    export CCACHE_DIR=$HOME'/.ccache'

    ## For `virtualenv'
    export VIRTUAL_ENV_DISABLE_PROMPT=1

    ## Contains the command to run the lightweight program used for editing files
    ## The editor program called by `sudoedit', `vipw', and other such programs when you tell them to edit a file
    if [[ -n "$DISPLAY" ]]; then export EDITOR='gedit'; else export EDITOR='nano'; fi

    ## Contains command to run the full-fledged editor that is used for more demanding tasks
    ## Many programs, including `less' and `crontab', will invoke VISUAL to edit a file, falling back to `EDITOR' if `VISUAL' is not set - but others invoke `EDITOR' directly
    if [[ -n "$DISPLAY" ]]; then export VISUAL='subl3'; else export EDITOR='ne'; fi

    ## Contains the path to the web browser
    if [[ -n "$DISPLAY" ]]; then export BROWSER='firefox'; else export BROWSER='lynx'; fi

    ## POSIX-compliant mode
    # export POSIXLY_CORRECT=1 # NOTE: conflicts w/ `yaourt'
}
# *****************************************************************************


# ***************************** Flavour w/ Bash options... ********************
function __init_shell_opts__ {
    ## NOTE: See `http://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html'
    HISTFILE=$HOME'/.bash_history'
    HISTFILESIZE=-1
    HISTSIZE=-1
    HISTCONTROL='ignoredups:ignorespace:erasedups'
    HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls *:ls'
    IFS=$' \n\t'
    COMP_WORDBREAKS=$COMP_WORDBREAKS'{}'

    ## NOTE: See `http://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html'
    set -o emacs
    # set -o errexit # for debugging purposes
    set -o monitor
    set -o noclobber
    set -o notify
    # set -o noexec # for debugging purposes
    # set -o nounset # NOTE: unbound vars is present in `bash_completion'
    # set -o posix
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
    # shopt -s complete_fullquote # enabled by default
    shopt -s direxpand
    shopt -s dirspell
    # shopt -s dotglob
    # shopt -s expand_aliases # enabled by default
    shopt -s extglob
    # shopt -s extquote # enabled by default
    # shopt -s failglob
    # shopt -s force_fignore # enabled by default
    shopt -s globstar
    # shopt -s gnu_errfmt
    shopt -s histappend
    shopt -s histreedit
    shopt -s histverify
    # shopt -s hostcomplete # enabled by default
    shopt -s huponexit
    # shopt -s interactive_comments # enabled by default
    shopt -s lithist
    shopt -s no_empty_cmd_completion
    # shopt -s nocaseglob
    # shopt -s nocasematch
    # shopt -s nullglob
    # shopt -s progcomp # enabled by default
    # shopt -s promptvars # enabled by default
    # shopt -s shift_verbose
    # shopt -s sourcepath # enabled by default
    # shopt -s xpg_echo

    complete -cf su sudo gksu gksudo kdesu man
}
# *****************************************************************************


# ***************************** And some aliases ... **************************
function __init_aliases__ {
    ## Make it shine...
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
    cmd_exists 'colordiff' && alias diff='colordiff'
    alias gcc='gcc -fdiagnostics-color=auto'
    alias dmesg='dmesg --color=auto'
    alias pacman='pacman --color=auto'
    alias yaourt='yaourt --color=auto'

    ## For interactive & verbose file operations...
    alias rm='rm -iv'
    alias cp='cp -iv'
    alias mv='mv -iv'

    ## Make it human readable by default
    alias df='df -h'
    alias du='du -h'

    ## Some shortcuts for different directory listings
    alias ls='ls -hF --color=auto'                # classify files in colour and make sizes human-readable
    alias dir='ls --color=auto --format=vertical'
    alias vdir='ls --color=auto --format=long'
    alias ll='ls -l --color=auto'                 # long list
    alias la='ls -A --color=auto'                 # all but . and ..
    alias lc='ls -C --color=auto'                 # classify + columns
    alias l.='ls -d .* --color=auto'              # dotfiles
    alias lr='ls -AR | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less' # full recursive directory listing

    ## Make some commands more comfortable to use
    alias mkdir='mkdir -pv'
    alias ..='cd ./../'
    alias ...='cd ./../../'
    alias .-='cd -'
    alias .~='cd ~'

    ## Shortcuts...
    alias g='grep'
    alias gi='grep -i'
    alias t='time'
    alias h='history'
    alias l='less'
    alias cls='clear'
    alias rst='reset'
    alias lo='logout'
    alias cmx='chmod +x'
    alias snn='sudo nano'
    alias ssc='sudo systemctl'
    alias rscp='rsync --progress --human-readable --verbose --archive --recursive'
    alias gcl='git clone'
    alias gl='git log --graph --decorate'
    alias glo='git log --oneline --graph --decorate'
    alias gu='git pull'
    alias gp='git push'
    alias gr='gradle run'
    alias ga='gradle assemble'
    alias gc='gradle clean'
    alias fm='ranger'

    ## Yet another shortcuts...
    alias fcnt='echo $(ls -1 | wc -l)'
    alias fnd='find . -name'
    alias ups='ps -u "$USER" -o pid,%cpu,%mem,start,time,bsdtime,command'
    alias pidof='lsof -t -c'
    alias ducsh='du -csh * | sort -rh'
	alias whence='type -a'

    alias pgsh='sudo su - postgres'
    alias djtst='python2 ./manage.py runserver'
    alias veact='source ./bin/activate'
    alias apaclog='tail -f /var/log/apache2/access_log'
    alias sassw='bundle exec sass --watch --sourcemap=none .'

    alias rsy='repo sync -f -j10'
    alias bes='source ./build/envsetup.sh'
	
    alias mkgrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
    alias mkcpio='sudo mkinitcpio -p linux'

    alias bigtmp='sudo mount -o remount,size=4G,noatime /tmp'
    alias rfrc='source $HOME/.bashrc'

    alias shu='sudo shutdown -h now'
    alias reb='sudo shutdown -r now'
    alias kreb='sudo kexec -l /boot/vmlinuz-linux --initrd=/boot/initramfs-linux.img --reuse-cmdline; sudo kexec -e'

    ## And don't forget about `pacman'...
    alias pacupg='sudo pacman -Syu'		# Synchronize with repositories and then upgrade packages that are out of date on the local system.
    alias pacin='sudo pacman -S'		# Install specific package(s) from the repositories
    alias pacins='sudo pacman -U'		# Install specific package not from the repositories but from a file
    alias pacre='sudo pacman -R'		# Remove the specified package(s), retaining its configuration(s) and required dependencies
    alias pacrem='sudo pacman -Rns'		# Remove the specified package(s), its configuration(s) and unneeded dependencies
    alias pacrep='pacman -Si'		    # Display information about a given package in the repositories
    alias pacreps='pacman -Ss'		    # Search for package(s) in the repositories
    alias pacloc='pacman -Qi'		    # Display information about a given package in the local database
    alias paclocs='pacman -Qs'		    # Search for package(s) in the local database
    alias paclo='pacman -Qdt'		    # List all packages which are orphaned
    alias pacc='sudo pacman -Scc'		# Clean cache - delete all not currently installed package files
    alias paclf='pacman -Ql'		    # List all files installed by a given package
    alias pacexpl='pacman -D --asexp'	# Mark one or more installed packages as explicitly installed
    alias pacimpl='pacman -D --asdep'	# Mark one or more installed packages as non explicitly installed

    ## For recursively removing orphans and their configuration files
    alias pacro='sudo pacman -Rns $(pacman -Qtdq)'
    # '[r]emove [o]rphans' - recursively remove ALL orphaned packages
    alias pacro2="pacman -Qtdq 1>/dev/null && sudo pacman -Rns \$(pacman -Qtdq | sed -e ':a;N;\$!ba;s/\n/ /g')"

    ## Additional pacman alias examples
    alias pacupd='sudo pacman -Sy && sudo abs'   # Update and refresh the local package and ABS databases against repositories
    alias pacinsd='sudo pacman -S --asdeps'      # Install given package(s) as dependencies
    alias pacmir='sudo pacman -Syy'              # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
    alias pacown='pacman -Qo'                    # Which package owns a file?
    alias pacopt='sudo pacman -Sc && sudo pacman-optimize' # Optimize pacman database

    alias yaupg='sudo yaourt -Syu'               # Upgrade whole system w/ `yaourt'
    alias pacrk='sudo pacman-key --refresh-keys' # Refresh keychain
}
# *****************************************************************************


# ***************************** And nifty prompts... **************************
function __init_prompts__ {
    ## Some colors...
    ## NOTE: For color codes 
    ## see `../scripts/colors_and_formatting_16.bash'
    local __rese__='\[\e[0m\]'
    local __cya0__='\[\e[0;49;36m\]'
    local __cya1__='\[\e[7;49;36m\]'
    local __red1__='\[\e[7;49;31m\]'
    local __gre1__='\[\e[7;49;32m\]'
    local __mag1__='\[\e[7;49;35m\]'
    local __mag2__='\[\e[7;107;35m\]'
    local __whi0__='\[\e[0;49;37m\]'
    local __whi1__='\[\e[7;49;37m\]'
    local __yel1__='\[\e[7;49;33m\]'
    local __blu0__='\[\e[0;49;34m\]'
    local __blu1__='\[\e[7;49;34m\]'
    local __blu2__='\[\e[7;107;34m\]'

    ## ...and beautiful chars
    # ─╳→→↪↠↣→⇨↦↬⊕⟴⇛⇻⇉▶▷●◉◆◇○◈☑☒☐➥➥➦➜➞➡➢➣➤➩➯➮➭➲➨➽─━│┃┆┇┊┋▓▒░▞▚┏┗┃▼▽▶▷◀◁▲△╚═╔═✧✦⭆🢂🡆🞉◙🙼🞮🞓🞧🞿🞺🠶🢜🢝🢞🢟⬤⬛⭙🙾

    local __beg__='🙼' # prompt begin
    local __end__='🙼' # prompt end
    local __arr__='🢂' # arrow
    local __sep__='🙼' # sections separator
    local __ps2__='🢂'
    local __ps3__='🡆'
    local __ps4__='🠶'

    ## If set, the value is interpreted as a command to execute before the printing of each primary prompt
    PROMPT_COMMAND=$PROMPT_COMMAND"; history -a; echo -en '\a\n'; hr; echo -en '\n\n'"

    ## PSs
    ## TODO: powerline-style arrows
    ## NOTE:
    # Sequence  Description
    # \a        The ASCII bell character (you can also type \007)
    # \d        Date in "Wed Sep 06" format
    # \e        ASCII escape character (you can also type \033)
    # \h        First part of hostname (such as "mybox")
    # \H        Full hostname (such as "mybox.mydomain.com")
    # \j        The number of processes you've suspended in this shell by hitting ^Z
    # \l        The name of the shell's terminal device (such as "ttyp4")
    # \n        Newline
    # \r        Carriage return
    # \s        The name of the shell executable (such as "bash")
    # \t        Time in 24-hour format (such as "23:01:01")
    # \T        Time in 12-hour format (such as "11:01:01")
    # \@        Time in 12-hour format with am/pm
    # \u        Your username
    # \v        Version of bash (such as 2.04)
    # \V        Bash version, including patchlevel
    # \w        Current working directory (such as "/home/drobbins")
    # \W        The "basename" of the current working directory (such as "drobbins")
    # \!        Current command's position in the history buffer
    # \#        Command number (this will count up at each prompt, as long as you type something)
    # \$        If you are not root, inserts a "$"; if you are root, you get a "#"
    # \xxx      Inserts an ASCII character based on three-digit number xxx (replace unused digits with zeros, such as "\007")
    # \\        A backslash
    # \[        This sequence should appear before a sequence of characters that don't move the cursor (like color escape sequences). This allows bash to calculate word wrapping correctly.
    # \]        This sequence should appear after a sequence of non-printing characters.
    local __datetime__="$__cya1__  \D{%T}"
    local __user__="$__red1__  ~\u"
    local __host__="$__gre1__  @\H"
    local __dirpath__="$__mag2__  :\w"
    local __is_last_successful__='$([[ $? == 0 ]] && echo '✔' || echo '✘')'
    local __jobs_and_status__="$__whi1__  \!:\#:\j:"$__is_last_successful__
    local __git_ps__='$(__git_ps1 " 🙼  git:%s")'
    local __venv_ps__='$(__venv_ps1 " 🙼  venv:%s")'
    local __dirname__="$__yel1__  \W"$__git_ps__$__venv_ps__
    local __usermark__="$__blu2__  \$"

    PS1="$__rese__$__cya0__ $__beg__$__datetime__ $__sep__$__user__ $__sep__$__host__ $__sep__$__dirpath__ $__mag1__$__end__$__rese__\n$__rese__$__whi0__$__beg__$__jobs_and_status__ $__sep__$__dirname__ $__sep__$__usermark__ $__blu1__$__end__$__rese__  "
    PS2="$__rese__$__red1__$__ps2__ $__end__$__rese__ "
    PS3="$__rese__$__gre1__$__ps3__ $__end__$__rese__ "
    PS4="$__rese__$__blu1__$__ps4__ $__end__$__rese__ "
}
# *****************************************************************************


# *****************************************************************************
__use_system_bashrc__ && unset -f __use_system_bashrc__
__use_user_helpers__ && unset -f __use_user_helpers__ && backup_history # && welcome_msg
__use_system_helpers__ && unset -f __use_system_helpers__
__init_env_vars__ && unset -f __init_env_vars__
__init_shell_opts__ && unset -f __init_shell_opts__
__init_aliases__ && unset -f __init_aliases__
__init_prompts__ && unset -f __init_prompts__
# *****************************************************************************

## EOF
