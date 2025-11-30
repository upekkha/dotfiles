#!/bin/bash
# create symlinks to dotfiles
link="ln -snfv"
cd ~/
mkdir -p ~/.sessions
chmod 700 ~/.sessions
$link .dotfiles/.bash_logout .bash_logout
$link .dotfiles/.bash_profile .bash_profile
$link .dotfiles/.bash_sessions_disable .bash_sessions_disable
$link .dotfiles/.dir_colors .dir_colors
$link .dotfiles/.gitconfig .gitconfig
$link .dotfiles/.gnupg .gnupg
$link .dotfiles/.hushlogin .hushlogin
$link .dotfiles/Scripts Scripts
$link .dotfiles/.ssh .ssh
$link .dotfiles/.tmux.conf .tmux.conf
$link .dotfiles/.vim .vim
$link .dotfiles/.vimrc .vimrc
mkdir -p ~/.config/ranger
$link ../../.dotfiles/.config/ranger/rc.conf .config/ranger/rc.conf
$link ../../.dotfiles/.config/ranger/scope.sh .config/ranger/scope.sh
mkdir -p ~/Library/Application\ Support/Code/User
cd ~/Library/Application\ Support/Code/User
$link ../../../../.dotfiles/.vscode/settings.json settings.json
$link ../../../../.dotfiles/.vscode/keybindings.json keybindings.json
$link ../../../../.dotfiles/.vscode/snippets snippets
#$link .dotfiles/.editrc .editrc
#$link .dotfiles/.latexmkrc .latexmkrc
#$link ../.dotfiles/.config/nvim .config/nvim
#$link .dotfiles/.perltidyrc .perltidyrc
#$link .dotfiles/.screenrc .screenrc
#$link .dotfiles/.xmodmap .xmodmap
#$link .dotfiles/.zshrc .zshrc
