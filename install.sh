#install i3-gaps
pacman -S i3-gaps --noconfirm
#install dmenu
pacman -S dmenu --noconfirm
#install i3blocks
pacman -S i3blocks --noconfirm
#install compton 
pacman -S compton --noconfirm
#Install zsh
pacman -S zsh --noconfirm
#Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#install vim
pacman -S gvim --noconfirm
#install ctags
pacman -S ctags --noconfirm
#install php
pacman -S php --noconfirm
#install composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
#install php-cs-fixer
composer global require friendsofphp/php-cs-fixer
#install php-stan
composer require --dev phpstan/phpstan
#install feh for background image
pacman -S feh --noconfirm
#Install fireshot (Screenshot tool)
pacman -S flameshot --noconfirm
