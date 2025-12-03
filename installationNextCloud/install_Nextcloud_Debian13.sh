#!/bin/bash
# installation automatisée de Nextcloud
# Par nassim.arrasspro@gmail.com
set -e
DB_NAME="nextdb"
DB_USER="nextcloudUser"
DB_PASS="P@ssw0rd"
NEXTCLOUD_IP=10.59.20.204
NETCARD_NAME="ens18"
GATEWAY="10.59.20.253"
DNS1="10.59.100.101"
DNS2="10.59.100.101"
echo "[0/7] ➤ Attribution d'une IP fixe"
sleep 3
if ! grep -q "$NETCARD_NAME" /etc/network/interfaces; then
    cat <<EOF >> /etc/network/interfaces

auto $NETCARD_NAME
iface $NETCARD_NAME inet static
    address $NEXTCLOUD_IP
    netmask 255.255.255.0
    gateway $GATEWAY
    dns-nameservers $DNS1 $DNS2
EOF
fi

systemctl restart networking
# Mise à jour de la machine Debian 13
echo "[1/7] ➤ Mise à jour de la machine"
sleep 3
apt update &&  apt upgrade -y
apt install wget unzip -y


echo "[2/7] ➤ Installation et activation d'Apache 2"
sleep 3
apt install apache2 -y
systemctl start apache2 &&  systemctl enable apache2


echo "[3/7] ➤ Installation et activation de MariaDB"
sleep 3
apt install mariadb-server -y
systemctl start mariadb &&  systemctl enable mariadb


echo "[4/7] ➤ Installation de PHP et de ces dépendances"
sleep 3
apt install php php-xml php-intl php-bcmath php-gmp php-imagick libapache2-mod-php php-cgi php-mysqli php-pear php-phpseclib php-mysql php-mbstring php-zip php-gd php-curl php-common -y


echo "[5/7] ➤ Création de la base de données Nextcloud"
sleep 3
mariadb <<EOF
CREATE USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';

CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'localhost';

FLUSH PRIVILEGES;

EXIT;
EOF


echo "[6/7] ➤ Téléchargement et extraction de l'archive Nextcloud"
sleep 3 
cd /var/www/html

wget https://download.nextcloud.com/server/releases/latest.zip
unzip latest.zip

chown -R www-data:www-data nextcloud/

find . -type f -exec chmod 644 {} \;

find . -type d -exec chmod 755 {} \;
rm latest.zip


echo "[7/7] ➤ Création du fichier de configuration Apache pour nextcloud"
sleep 3
cat <<EOF > /etc/apache2/sites-available/nextcloud.conf
<VirtualHost *:80>
ServerName $NEXTCLOUD_IP
DocumentRoot /var/www/html/nextcloud

<Directory /var/www/html/nextcloud>
AllowOverride All
</Directory>

ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
EOF
a2enmod rewrite
a2ensite nextcloud.conf
a2dissite 000-default.conf
apachectl -t
read -n 1 -s -r -p "Appuyez sur une touche si la syntaxe est valide..."

systemctl restart apache2