#!/bin/bash
echo "This script will add symlinks from dotfiles to home directory"

rm -rf ~/.vim ~/.vimrc ~/.bashrc

ln -s ~/.dotfiles/.vim/ ~/
ln -s ~/.dotfiles/.vim/.vimrc ~/
ln -s ~/.dotfiles/.bashrc ~/
ln -s ~/.dotfiles/.fehbg ~/

# if vundle allready exists don't install
! [ -d ~/.vim/bundle/Vundle.vim/autoload ] \
    && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
     ; vim +PluginInstall +qall

# if no .config dir is setup, then create one
! [ -d ~/.config/ ] \
    && mkdir ~/.config/ 

# if i3 has config file then delete it and replace it with new config file
[ -d ~/.config/i3/ ] \
    && rm -rf ~/.config/i3/* \
     ; ln -s ~/.dotfiles/i3/config ~/.config/i3/

# if i3block has config file, delete it and replace with config file
[ -d ~/.config/i3blocks/ ] \
    && rm -rf ~/.config/i3blocks/* \
    || mkdir i3blocks
ln -s ~/.dotfiles/i3blocks/config ~/.config/i3blocks/

[ -d ~/.config/compton/ ] \
    && rm -rf ~/.config/compton/* \
    || ln -s ~/.dotfiles/compton/config ~/.config/compton/

i3-msg restart

echo "Script finished!"
