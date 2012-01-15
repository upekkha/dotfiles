
# ------  misc zsh settings  ---------{{{
# misc zsh options
autoload -U colors && colors     # colored prompt
setopt prompt_subst              # allow variable substitution in prompt
setopt beep                      # toggle beep on error
unsetopt list_beep               # toggle beep on tab-completion
unsetopt correct_all             # toggle autocorrection of commands. Use alias man='nocorrect man' to turn off for specific commands.
setopt extended_glob             # enable extended globbing features
setopt nomatch                   # print warning if not matching file was found
setopt multios                   # allow multiple file redirections
setopt equals                    # allow use of = to expand command names

# directory options
setopt auto_cd                   # entering the name of a directory automatically changes to it
unsetopt auto_name_dirs          # toggle replacing path with existing variable name
setopt auto_pushd                # push all directories to stack
setopt pushd_ignore_dups         # don't add duplicate entries to the stack
export DIRSTACKSIZE=10           # maximal number of directories in stack

# history options
setopt append_history            # append to history when shell exits
setopt inc_append_history        # append to history when a line is executed
setopt share_history             # also pull changes from file to all shells and activate extended_history
setopt extended_history          # toggle saving timestamps to history file
unsetopt hist_no_functions       # toggle saving functions to history file
unsetopt hist_ignore_space       # toggle saving commands beginning with a blank
setopt hist_reduce_blanks        # remove superfluous blanks in history
setopt hist_ignore_dups          # ignore sequential duplicate commands
unsetopt hist_ignore_all_dups    # don't ignore any duplicate commands
setopt hist_expire_dups_first    # expire duplicate entries in history first
setopt hist_find_no_dups         # ignore duplicates when searching in history
unsetopt hist_verify             # toggle reprinting before executing lines with history substitutions

# autoquote metacharacters in urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# edit command line in editor
autoload -U edit-command-line
zle -N edit-command-line
#}}}

# ------  oh my zsh plugins  ---------{{{
DISABLE_AUTO_TITLE="false"       # toggle setting terminal title in termsupport plugin
ZSH=$HOME/.dotfiles/.zshplugins  # folder containing zsh plugins

# define plugins to activate
plugins=(git termsupport gem)

# add all defined plugins to fpath
plugin=${plugin:=()}
for plugin ($plugins); do
  fpath=($ZSH/$plugin $fpath)
done

# load and run compinit
autoload -U compinit
compinit -i

# load all defined plugins
for plugin ($plugins); do
  if [ -f $ZSH/$plugin/$plugin.plugin.zsh ]; then
    source $ZSH/$plugin/$plugin.plugin.zsh
  fi
done
#}}}

# ------  tab completion  ------------{{{
# completion options
setopt auto_menu                 # show completion menu on succesive tab press
setopt menu_complete             # toggle auto-selecting first menu entry (overrides auto_menu)
setopt always_last_prompt        # second tab replaces first suggestions instead of reprinting new prompt
setopt list_types                # append types of files in tab-completion menu (like ls -F)
unsetopt list_rows_first         # list files by columns, not rows in tab-completion menu
setopt complete_in_word          # allow completion inside word instead of putting cursor to end of word
setopt always_to_end             # when completing inside word, move cursor to end after full completion is inserted

# load complist module to extend completion listings
zmodload -i zsh/complist
# use list-colors style to set color specifications
zstyle ':completion:*' list-colors ''
# highlight partial match in red when tab completing
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==31=00}:${(s.:.)LS_COLORS}")';

# use graphical menu for tab completion
zstyle ':completion:*:*:*:*:*' menu select

# completion of processes
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
        dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
        hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
        mailman mailnull mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
        operator pcap postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs
# ... unless we really want to.
zstyle '*' single-ignored show

# case-insensitive (all), partial-word and then substring completion (oh-my-zsh)
CASE_SENSITIVE="true"
if [ "x$CASE_SENSITIVE" = "xtrue" ]; then
  zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  unset CASE_SENSITIVE
else
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
fi
#}}}

# ------  command prompt  ------------{{{
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%} ("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}±%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# root prompt
if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
if [ $UID -eq 0 ]; then USER="root@"; else USER=""; fi

PROMPT='%{$fg[$NCOLOR]%}$USER%m:%{$reset_color%}%{$fg[magenta]%}%30<..<%~%<</%{$reset_color%}$(git_prompt_info) '

# right-aligned prompt
#RPROMPT='%{$fg[green]%}[%T]%{$reset_color%}'
#}}}

# ------  vi-mode plugin  ------------{{{
# oh-my-zsh/plugins/vi-mode/vi-mode.plugin.zsh
function zle-line-init zle-keymap-select {
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

bindkey -v

# if mode indicator wasn't setup by theme, define default
if [[ "$MODE_INDICATOR" == "" ]]; then
  MODE_INDICATOR="%{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"
fi

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

# define right prompt, if it wasn't defined by a theme
if [[ "$RPS1" == "" && "$RPROMPT" == "" ]]; then
  RPS1='$(vi_mode_prompt_info)'
fi
#}}}

# ------  key bindings  --------------{{{
# emacs shortcuts
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^U' backward-kill-line

# alt-v pastes previous word
bindkey "^B" copy-prev-shell-word

# history search
bindkey '^r' history-incremental-search-backward
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^O' accept-line-and-down-history

# make fn+backspace forward delete character
bindkey "^[[3~" delete-char

# edit command line in editor
bindkey '\C-x\C-e' edit-command-line

# tab-completion menu: <CR> closes menu and enters command
bindkey -M menuselect '^M' .accept-line

# use <space> to insert blank and expand all history substitutions on current line
bindkey ' ' magic-space
#}}}

# ------  source .shrc  --------------{{{
if [ -f $HOME/.dotfiles/.shrc ]; then
    source $HOME/.dotfiles/.shrc
else
    echo "Error: Couldn't find ~/.dotfiles/.shrc"
fi
#}}}

# ------  Vim Modeline  --------------{{{
# vim: set foldmethod=marker:
#}}}
