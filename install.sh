#install i3-gaps
sudo pacman -S xorg-server xorg-xinit xorg-xinput xf86-input-libinput acpi i3-gaps i3blocks i3lock dmenu zsh the_silver_searcher feh flameshot lsd xfce4-terminal firefox alsa-utils weechat gvim php ctags openssh filezilla docker docker-compose unzip --noconfirm
pacman -S compton --noconfirm

#Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#install composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
composer global require friendsofphp/php-cs-fixer
#install php-stan
#composer require --dev phpstan/phpstan

pacman -S base-devel
git clone https://aur.archlinux.org/yay.git ~/yay 
cd ~/yay && makepkg -si
yay -S nerd-fonts-hack --noconfirm
yay -S bitwarden-bin --noconfirm
yay -S vscodium-bin --noconfirm
yay -S slack-desktop --noconfirm
