# FZF key bindings
# Source: https://github.com/junegunn/fzf/blob/master/shell/key-bindings.bash

__fzf_select__() {
  local cmd="${FZF_CTRL_T_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | cut -b3-"}"
  eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" $(__fzfcmd) -m "$@" | while read -r item; do
    printf '%q ' "$item"
  done
  echo
}

if [[ $- =~ i ]]; then

__fzfcmd() {
  [ -n "$TMUX_PANE" ] && { [ "${FZF_TMUX:-0}" != 0 ] || [ -n "$FZF_TMUX_OPTS" ]; } &&
    echo "fzf-tmux ${FZF_TMUX_OPTS:--d${FZF_TMUX_HEIGHT:-40%}} -- " || echo "fzf"
}

fzf-file-widget() {
  local selected="$(__fzf_select__)"
  READLINE_LINE="${READLINE_LINE:0:$READLINE_POINT}$selected${READLINE_LINE:$READLINE_POINT}"
  READLINE_POINT=$(( READLINE_POINT + ${#selected} ))
}

__fzf_cd__() {
  local cmd dir
  cmd="${FZF_ALT_C_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type d -print 2> /dev/null | cut -b3-"}"
  dir=$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(__fzfcmd) +m) && printf 'cd %q' "$dir"
}

__fzf_history__() {
  local output
  output=$(
    builtin fc -lnr -2147483648 |
      last_hist=$(HISTTIMEFORMAT='' builtin history 1) perl -n -l0 -e 'BEGIN { getc; $/ = "\n\t"; $HISTCMD = $ENV{last_hist} + 1 } s/^[ *]//; print $HISTCMD - $. . "\t$_" if !$seen{$_}++' |
      FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort,ctrl-z:ignore $FZF_CTRL_R_OPTS +m --read0" $(__fzfcmd) --query "$READLINE_LINE"
  ) || return
  READLINE_LINE=${output#*$'\t'}
  if [ -z "$READLINE_POINT" ]; then
    echo "$READLINE_LINE"
  else
    READLINE_POINT=0x7fffffff
  fi
}

# Required to refresh the prompt after fzf
bind -m emacs-standard '"\er": redraw-current-line'

# CTRL-P - Paste the selected file path into the command line
bind -m emacs-standard -x '"\C-p": fzf-file-widget'

# CTRL-R - Paste the selected command from history into the command line
bind -m emacs-standard -x '"\C-r": __fzf_history__'

# ESC-C - cd into the selected directory
#FZF_ALT_C_COMMAND='fd --type d'
#bind -m emacs-standard '"\ec": " \C-b\C-k \C-u`__fzf_cd__`\e\C-e\er\C-m\C-y\C-h\e \C-y\ey\C-x\C-x\C-d"'

fi


#__fzf_history__() (
  #shopt -u nocaseglob nocasematch
  #edit_key=${FZF_CTRL_R_EDIT_KEY:-ctrl-e}
  #exec_key=${FZF_CTRL_R_EXEC_KEY:-enter}
  #if selected=$(
    #HISTTIMEFORMAT= history |
    #FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS --tac --sync -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS --expect=$edit_key,$exec_key +m" $(__fzfcmd) |
    #command grep "^\\($exec_key$\\|$edit_key$\\| *[0-9]\\)")
  #then
    #key=${selected%%$'\n'*}
    #line=${selected#*$'\n'}

    #result=$(
      #if [[ $- =~ H ]]; then
        #sed 's/^ *\([0-9]*\)\** .*/!\1/' <<< "$line"
      #else
        #sed 's/^ *\([0-9]*\)\** *//' <<< "$line"
      #fi
    #)

    #case $key in
      #$edit_key) result=$result$__fzf_edit_suffix__;;
      #$exec_key) result=$result$__fzf_exec_suffix__;;
    #esac

    #echo "$result"
  #else
    ## Ensure that no new line gets produced by CTRL-X CTRL-P.
    #echo "$__fzf_edit_suffix__"
  #fi
#)

#__fzf_edit_suffix__=#FZFEDIT#
#__fzf_exec_suffix__=#FZFEXEC#

#__fzf_rebind_ctrl_x_ctrl_p__() {
  #if test "${READLINE_LINE: -${#__fzf_edit_suffix__}}" = "$__fzf_edit_suffix__"; then
    #READLINE_LINE=${READLINE_LINE:0:-${#__fzf_edit_suffix__}}
    #bind '"\C-x\C-p": ""'
  #elif test "${READLINE_LINE: -${#__fzf_exec_suffix__}}" = "$__fzf_exec_suffix__"; then
    #READLINE_LINE=${READLINE_LINE:0:-${#__fzf_exec_suffix__}}
    #bind '"\C-x\C-p": accept-line'
  #fi
#}

#bind '"\C-x\C-p": ""'
#bind -x '"\C-x\C-o": __fzf_rebind_ctrl_x_ctrl_p__'

#if [[ ! -o vi ]]; then
  #bind '"\C-r": " \C-e\C-u\C-y\ey\C-u`__fzf_history__`\e\C-e\er\e^\C-x\C-o\C-x\C-p"'
#else
  #bind '"\C-r": "\C-x\C-addi`__fzf_history__`\C-x\C-e\C-x\C-r\C-x^\C-x\C-a$a\C-x\C-o\C-x\C-p"'
#fi
