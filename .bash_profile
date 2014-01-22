
# ------  misc bash settings  --------{{{
shopt -s histappend     # append history lists of different sessions instead of overwriting
#}}}

# ------  source .shrc  --------------{{{
if [ -f $HOME/.dotfiles/.shrc ]; then
    source $HOME/.dotfiles/.shrc
else
    echo "Error: Couldn't find ~/.dotfiles/.shrc"
fi
#}}}

# ------  inputrc settings  ----------{{{
# don't ignore case when tab-completing
bind 'set completion-ignore-case off'
# add trailing '/' when tab-completing folders
bind 'set mark-directories on'
bind 'set mark-symlinked-directories on'
# unicode readline
bind 'set input-meta on'
bind 'set output-meta on'
bind 'set convert-meta off'
# word jumping with Shift-Ctrl-Left/Right in iTerm2
bind '"\e[1;6D": backward-word'
bind '"\e[1;6C": forward-word'
#}}}

# ------  custom bash prompt  --------{{{
my_command_prompt(){

    # Truncate the directory path if it exceeds a certain length
    truncate_pwd
    # Display git branch and dirty status
    git_status_prompt

        # Define colors
        local WHITE="\[\033[1;37m\]"
        local GREEN="\[\033[0;32m\]"
        local CYAN="\[\033[0;36m\]"
        local GRAY="\[\033[0;37m\]"
        local BLUE="\[\033[0;34m\]"
        local MAGENTA="\[\033[0;35m\]"
        local RED="\[\033[0;31m\]"
        local YELLOW="\[\033[0;33m\]"

    # define root prompt
    export SUDO_PS1="${RED}\u@\h:${MAGENTA}\w/ ${GRAY}"

    USRNAME=`whoami`
    if [ "$USRNAME" == "root" ]; then
        export PS1="${RED}\u@\h:${MAGENTA}\w/ ${GRAY}"
    else
        export PS1="${GREEN}\h:${MAGENTA}\${NEW_PWD}/${YELLOW}\${GITSTAT} ${GRAY}"
    fi
}

function truncate_pwd #{{{
{
        local pwdmaxlen=25
        local trunc_symbol=".."
        local dir=${PWD##*/}
        pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
        NEW_PWD=${PWD/#$HOME/\~}
        local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
        if [ ${pwdoffset} -gt "0" ]
        then
                NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
                NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
        fi
}
#}}}

function git_status_prompt #{{{
{
    local GITSTATUS=`git status 2>&1`

    # Retrieve current branch
    if [[ ${GITSTATUS} =~ On\ branch\ ([^[:space:]]+) ]]; then
        GITBRANCH=${BASH_REMATCH[1]}
    fi

    if [[ ${GITSTATUS} =~ "Not a git repository" ]]; then
        # No git repo
        GITSTAT=""
    elif [[ ${GITSTATUS} =~ "must be run in a work tree" ]]; then
        # Bare git repo
        GITSTAT=""
    elif [[ ${GITSTATUS} =~ "working directory clean" ]]; then
        # Clean repo
        GITSTAT="[${GITBRANCH}]"
        # Display only if not on master branch
        test "$GITBRANCH" != master || GITSTAT=""
    else
        # Dirty repo
        GITSTAT="[${GITBRANCH} ±]"
        # Display only if not on master branch
        test "$GITBRANCH" != master || GITSTAT="[±]"
    fi
}
#}}}

PROMPT_COMMAND=my_command_prompt
#}}}

# ------  rmm: move to trash  --------{{{
# rmm: move to trash instead of deleting with rm
rmm ()
{
    local F
    local HOME_DEVICE="$(stat -f %Sd "$HOME")"
    local TRASHCAN=~/.Trash
    for F in "$@"
    do
        if ! test -e "$F"
        then
            echo "No such file or directory: $F" 1>&2
            return 4
        fi

        local DEVICE="$(stat -f %Sd "$F")"

        if [ x"$DEVICE" == x"" ] || [ x"$DEVICE" == x"???" ]
        then
            echo "Can't locate trash for ${F}." 1>&2
            return 3
        fi

        if [ x"$DEVICE" != x"$HOME_DEVICE" ]
        then
            TRASHCAN="$(trashOnDevice "$DEVICE")"
        fi

        if [ ! -d "${TRASHCAN}" ]
        then
            command rm -f "${TRASHCAN}"
            if ! mkdir -m 700 "${TRASHCAN}"
            then
                echo "$TRASHCAN is inaccessible at this time." | sed 's;'"$HOME"';~;g' 1>&2
                return 1
            fi
        fi

        local FinT="$(basename "$F")"

        # prepend date if file already exists
        if [ -e "${TRASHCAN}/${FinT}" ]
        then
            FinT="$(date +%H-%M-%S) ${FinT}"
        fi

        # mv -vn = verbose, to show files being moved
        if ! mv -n "$F" "${TRASHCAN}/${FinT}"
        then
            echo "Unable to move $F to the trash." 1>&2
            return 2
        fi
    done

    # Show total size of trash
    #local TRASHSIZE="$(du -hs "${TRASHCAN}" 2>/dev/null | cut -f 1)"
    #local TRASHCANloc="$(dirname "$TRASHCAN" | sed 's;^/Volumes/\(.*\)/.Trashes;\1;g' | sed 's;'"$HOME"';~;g' | sed 's;^/.Trashes;/;g')"
    #echo "${TRASHSIZE:-  0B} in trash on $TRASHCANloc."
}

# Get trash on mounted device
function trashOnDevice ()
{
    local DEVICE="$1"
    local MOUNT="$(mount | sed -n 's:/dev/'"$DEVICE"' on \(.*\) (.*):\1:p')"

    if [ x"$MOUNT" == x"" ] || [ x"$MOUNT" == x"???" ]
    then
        # If no mount point is found, then don't return the path to root!
        return 1
    elif [ x"$MOUNT" == x"/" ]
    then
        # Encourage the resulting path to _not_ start with two slashes
        MOUNT=""
    fi

    echo "$MOUNT/.Trashes/$UID"
}
#}}}

# ------  tab-completion hacks  ------{{{
# auto-complete commands after sudo, man, mans
complete -cf sudo
complete -cf man
complete -cf mans
complete -cf manv
complete -cf mangv

# auto-complete like scp after custom gvimscp
complete -F _scp -o nospace gvimscp

# Bash_completion
if [ -f ~/.dotfiles/.bash_completion ]; then
    . ~/.dotfiles/.bash_completion
fi

# auto-complete remote hosts for ssh -> bash_completion
# Rem: does not work for ssh user@host; instead use ssh host -l user
#complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
#}}}

# ------  Vim Modeline  --------------{{{
# vim: set foldmethod=marker:
#}}}
