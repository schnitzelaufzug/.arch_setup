#!/bin/sh

arch_setup=~/.arch_setup
dotfiles=$arch_setup/dotfiles

echo "This script will add symlinks from dotfiles to home directory"

ln -s $arch_setup/.vim/ ~/

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
    || mkdir ~/.config/i3/ 
ln -s $arch_setup/i3/config ~/.config/i3/

# if i3block has config file, delete it and replace with config file
[ -d ~/.config/i3blocks/ ] \
    && rm -rf ~/.config/i3blocks/* \
    || mkdir ~/.config/i3blocks/
ln -s $arch_setup/i3blocks/config ~/.config/i3blocks/
git clone https://github.com/vivien/i3blocks-contrib ~/.config/i3blocks/scripts  

[ -d ~/.config/compton/ ] \
    && rm -rf ~/.config/compton/* \
    || mkdir ~/.config/compton/
ln -s $arch_setup/compton/config ~/.config/compton/

[ -d ~/.config/git/ ] \
    && rm -rf ~/.config/git/* \
    || mkdir ~/.config/git/
ln -s $arch_setup/git/ignore ~/.config/git/

for file in $dotfiles/.*; do
	[ -f $file ] \
		&& ln -sf $file ~/
done

#ln -s ~/.dotifles/terminalrc ~/.config/xfce4/terminal/terminalrc

i3-msg restart

echo "Script finished!"
