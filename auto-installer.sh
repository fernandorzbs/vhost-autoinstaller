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
echo "  Instalando PHP 8.0            "
echo "================================"
echo -e "\n\n"
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get install php8.0 libapache2-mod-php8.0 -y
sudo systemctl restart apache2
