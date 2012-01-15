#!/bin/bash
# create symlinks to dotfiles
link="ln -snfv"
cd ~/
mkdir -p ~/.irssi
mkdir -p ~/.sessions
chmod 700 ~/.sessions
$link .dotfiles/.ackrc .ackrc
$link .dotfiles/.bash_logout .bash_logout
$link .dotfiles/.bash_profile .bash_profile
$link .dotfiles/.bazaar .bazaar
$link .dotfiles/.colordiffrc .colordiffrc
#$link .dotfiles/.colortailrc .colortailrc
#$link .dotfiles/.conkyrc .conkyrc
$link .dotfiles/.csshcluster .csshcluster
$link .dotfiles/.csshrc .csshrc
$link .dotfiles/.ctags .ctags
$link .dotfiles/.dir_colors .dir_colors
$link .dotfiles/.gitconfig .gitconfig
$link .dotfiles/.hushlogin .hushlogin
$link .dotfiles/.inputrc .inputrc
$link ../.dotfiles/.irssi/config .irssi/config
$link ../.dotfiles/.irssi/startup .irssi/startup
#$link .dotfiles/.latexmkrc .latexmkrc
#$link .dotfiles/.latexmkrc_ns .latexmkrc_ns
#$link .dotfiles/.matplotlib .matplotlib
$link .dotfiles/.multitailrc .multitailrc
$link .dotfiles/.netrc .netrc
$link .dotfiles/.screenrc .screenrc
$link .dotfiles/Scripts Scripts
$link .dotfiles/.ssh .ssh
$link .dotfiles/.synergy.conf .synergy.conf
$link .dotfiles/.tmux.conf .tmux.conf
$link .dotfiles/.vim .vim
$link .dotfiles/.vimrc .vimrc
$link .dotfiles/.xmodmap .xmodmap
$link .dotfiles/.zshrc .zshrc
