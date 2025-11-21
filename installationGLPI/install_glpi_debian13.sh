#!/bin/bash
# installation automatisée de GLPI
# Inspiré Par le script zabbix sbeteta@beteta.org
# Par nassim.arrasspro@gmail.com

# Variables de base
DB_USER="glpi"
DB_PASS="password"
DB_NAME="glpi-db"
SERVER_IP=$(hostname -I | awk '{print $1}')
SERVER_NAME=$(hostname| awk '{print $1}')

# Mise à jour de la machine Debian 13
echo "[1/8] Mise à jour de la machine"
sleep 3
apt update &&  apt upgrade -y

# Ajout du dépôt glpi 11.0.2 pour Debian 13
echo "[2/8] ➤ Ajout du dépôt glpi 11.0.2 pour Debian 13..."
sleep 3
wget https://github.com/glpi-project/glpi/releases/download/11.0.2/glpi-11.0.2.tgz
tar -xvzf glpi-11.0.2.tgz -C /var/www/html
chown -R www-data:www-data /var/www/html/glpi
rm -f glpi-11.0.2.tgz
apt update -y
clear

# Installation de MariaDB, apache et php
echo "[3/8] ➤ Installation de MariaDB..."
sleep 3
apt install  mariadb-server apache2 php -y
# Installation des paquets PHP nécessaires à glpi
echo "[4/8] ➤ Installation des dépendances php et "
sleep 3
apt install php-fpm -y
apt install php-{mysql,mbstring,curl,gd,xml,intl,ldap,apcu,xmlrpc,zip,bz2,bcmath} -y
clear

# Création de la base de données Glpi
echo "[5/8] ➤ Création de la base de données Glpi..."
sleep 3
mariadb <<EOF
CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\` CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'localhost';
FLUSH PRIVILEGES;
EOF
clear

# Création du fichier de configuration Glpi pour le serveur Apache2

echo "[6/8] ➤ Création du fichier de configuration Glpi pour le serveur Apache2 ..."
cat <<EOF > /etc/apache2/sites-available/glpi.conf
<VirtualHost *:80>
    ServerName $SERVER_NAME
    ServerAlias $SERVER_IP
    DocumentRoot /var/www/html/glpi/public/index.php

    <Directory /var/www/html/glpi>
        Options -Indexes +FollowSymLinks
        Require all granted
        RewriteEngine On
        RewriteCond %{REQUEST_FILENAME} !-f
        RewriteCond %{REQUEST_FILENAME} !-d
        RewriteRule ^ index.php [QSA,L]
        AllowOverride All
    </Directory>

    <FilesMatch \.php$>
        SetHandler "proxy:unix:/run/php/php8.4-fpm.sock|fcgi://localhost"
    </FilesMatch>

    ErrorLog ${APACHE_LOG_DIR}/glpi_error.log
    CustomLog ${APACHE_LOG_DIR}/glpi_access.log combined
</VirtualHost>

EOF
clear
# Activation et désactivation des différents modules nécessaires
echo "[7/8] ➤ Activation et désactivation des différents modules nécessaires ..."

a2enmod proxy_fcgi setenvif
a2enmod rewrite
a2enconf php8.2-fpm
a2dissite 000-default.conf
a2ensite glpi.conf

clear

# Redémarrage du serveur Apache2

echo "[8/8] ➤ Redémarrage du serveur Apache2 ..."

systemctl restart apache2
systemctl enable apache2
clear

echo "GLPI est prêt à être configuré dans l'interface web"
echo " - Accédez à l'interface web via : http://$SERVER_IP/"
echo " les Identifiants par défaut : glpi / glpi"