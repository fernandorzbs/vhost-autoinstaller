#!/bin/bash
echo "-----------------------------------------";
echo "Auto installer para Apache vHost ubuntu"
echo "Autor: Fernando Rz";
echo "Versión: 1.0";
echo "========================================="
read -p 'Nombre del proyecto a crear: ' PROYECTNAME
URLPROYECT="/var/www/$PROYECTNAME"
mkdir $URLPROYECT
sudo cp "index.php" $URLPROYECT
echo "================================"
echo "Generando .conf"
CONFPATH="/etc/apache2/sites-available/$PROYECTNAME.conf"
sudo touch $CONFPATH
vHost1="<VirtualHost *:80>"
vHost2="\t DocumentRoot $URLPROYECT/"
vHost3="\t ServerName $PROYECTNAME.home"
vHost4="</VirtualHost>"
echo $vHost1 > $CONFPATH
echo -e $vHost2 >> $CONFPATH
echo -e $vHost3 >> $CONFPATH
echo -e $vHost4 >> $CONFPATH
echo "================================"
echo "Habilitando sitio"
sudo a2ensite "$PROYECTNAME.conf"
echo -e "127.0.0.1 $PROYECTNAME.home" >> "/etc/hosts"
service apache2 reload
systemctl reload apache2
echo "================================"
echo "Abriendo en el navegador"
URL="http://$PROYECTNAME.home"
echo "LINK: "$URL
exit 1