#!/bin/bash
# installation automatisée de ZABBIX
# Par sbeteta@beteta.org

# Variables de base
DB_USER="zabbix"
DB_PASS="password"
DB_NAME="zabbix"
SERVER_IP=$(hostname -I | awk '{print $1}')


# Ajout du dépôt Zabbix 7.0 pour Debian 12...
echo "[1/8] ➤ Ajout du dépôt Zabbix 7.4 pour Debian 13..."
sleep 3
wget https://repo.zabbix.com/zabbix/7.4/release/debian/pool/main/z/zabbix-release/zabbix-release_latest_7.4+debian13_all.deb
dpkg -i zabbix-release_latest_7.4+debian13_all.deb
apt update -y
clear

# Installation des paquets Zabbix + Agent + Apache
echo "[2/8] ➤ Installation de Zabbix server, frontend PHP, agent..."
sleep 3
apt install -y zabbix-server-mysql zabbix-frontend-php zabbix-sql-scripts zabbix-agent

# Installation de MariaDB
echo "[3/8] ➤ Installation de MariaDB..."
sleep 3
apt install -y mariadb-server

# Création de la base de données Zabbix
echo "[4/8] ➤ Création de la base de données Zabbix..."
sleep 3
mysql -uroot <<EOF
CREATE DATABASE ${DB_NAME} CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
CREATE USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';
SET GLOBAL log_bin_trust_function_creators = 1;
FLUSH PRIVILEGES;
EOF

# Import du schéma de base
echo "[5/8] ➤ Importation du schéma de la base Zabbix (patientez)..."
sleep 3
zcat /usr/share/zabbix/sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -u${DB_USER} -p${DB_PASS} ${DB_NAME}
# Désactivation log_bin_trust_function_creators
echo "[6/8] ➤ Réinitialisation du paramètre log_bin_trust_function_creators..."
sleep 3
mysql -uroot <<EOF
SET GLOBAL log_bin_trust_function_creators = 0;
EOF

# Configuration du mot de passe BDD dans zabbix_server.conf
echo "[7/8] ➤ Configuration du mot de passe MySQL dans zabbix_server.conf..."
sleep 3
sed -i "s|# DBPassword=|DBPassword=${DB_PASS}|" /etc/zabbix/zabbix_server.conf
clear

# Démarrage des services 
echo "[8/8] ➤ Démarrage et activation des services Zabbix..."
sleep 3
systemctl restart zabbix-server zabbix-agent apache2
systemctl enable zabbix-server zabbix-agent apache2

echo -e "Installation de Zabbix terminée avec succès !"
echo " - Accédez à l'interface web via : http://$SERVER_IP/zabbix"
echo " les Identifiants par défaut : Admin / zabbix"
