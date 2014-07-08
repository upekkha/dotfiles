
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
