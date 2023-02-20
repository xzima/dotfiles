#!/bin/bash

# move original dotfiles in $HOME
if [ -f ~/.zshrc ]
then
    mv -f ~/.zshrc ~/.zshrc-dist
fi

#if [ -f ~/.pathes ]
#then
#    mv -f ~/.pathes ~/.pathes-dist
#.fi

if [ -f ~/.bashrc ]
then
    mv -f ~/.bashrc ~/.bashrc-dist
fi
if [ -f ~/.bash_aliases ]
then
    mv -f ~/.bash_aliases ~/.bash_aliases.local
fi
if [ -f ~/.gitconfig ]
then
    mv -f ~/.gitconfig ~/.gitconfig.local
fi
if [ -f ~/.zshrc.pre-oh-my-zsh ]
then
    mv ~/.zshrc.pre-oh-my-zsh  ~/.zshrc.pre-oh-my-zsh-dist
fi

# create symlinks
ln -s ~/dotfiles/.zshrc ~/.zshrc
#ln -s ~/dotfiles/.pathes ~/.pathes
ln -s ~/dotfiles/.zshrc.pre-oh-my-zsh ~/.zshrc.pre-oh-my-zsh
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.bash_aliases ~/.bash_aliases
echo "done."

