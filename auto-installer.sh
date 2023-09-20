#!/bin/bash
echo -e "\n"
echo "-----------------------------------------";
echo "Auto installer ubuntu"
echo "Autor: Fernando Rz";
echo "Versión: 1.0";
echo "-----------------------------------------";
echo -e "\n"
read -p 'Desea instalar vHost auto load  [y/n]: ' answer
if [ "$answer" != 'y' ] && [ "$answer" != 'Y'  ]; then
   echo 'Saliendo del instalador...'
   exit 1
fi
echo -e "\n\n"
echo "=========================="
echo "   Actualizando sistema   "
echo "=========================="
echo -e "\n\n"
sudo apt-get update -y
sudo apt-get upgrade -y
echo -e "\n\n"
echo "================================"
echo "  Configurando Zona / Crontab   "
echo "================================"
echo -e "\n\n"
sudo timedatectl set-timezone America/Asuncion
echo -e "\n\n"
echo "================================"
echo "  Instalando Apache             "
echo "================================"
echo -e "\n\n"
sudo apt install -y apache2
sudo chmod 777 -R /var/www
echo -e "\n\n"
echo "================================"
echo "  Instalando PHP 7.3            "
echo "================================"
echo -e "\n\n"
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update -y
sudo apt install php7.3 -y
sudo apt install -y php7.3-curl php7.3-gd php7.3-json php7.3-mbstring php7.3-xml php7.3-zip php7.3-mysql phpenmod curl gd json mbstring xml zip
sudo systemctl restart apache2
echo -e "\n\n"
echo "================================"
echo "  Instalando PHP 8.2            "
echo "================================"
echo -e "\n\n"
sudo apt update -y
sudo apt install php8.2 -y
sudo apt-get install php8.2-zi php8.2-xml php@8.2-cur php@8.2-mysql -y
sudo apt-get install libapache2-mod-php8.2 php8.2-cli php8.2-common php8.2-fpm php8.2-mysql php8.2-zip php8.2-gd php8.2-mbstring php8.2-curl php8.2-xml php8.2-bcmath -y
sudo systemctl restart apache2
echo -e "\n\n"
echo "================================"
echo "  Instalando Composer           "
echo "================================"
echo -e "\n\n"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

