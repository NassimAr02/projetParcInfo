#!/bin/bash
#Installation Automatisé d'un agent zabbix pour les machines debian 13

SERVER_IP=xxx.xxx.xxx.xxx #Mettre l'IP du Server zabbix
FICHIER_CONF="/etc/zabbix/zabbix_agent2.conf"
#Mise à jour de la machine 
echo "[1/5] ➤ Mise à jour de la machine"
apt update && apt upgrade -y

#Récupération de l'archive et ajout des dépots
echo  "[2/5] ➤ Récupération de l'archive" 
wget https://repo.zabbix.com/zabbix/8.0/release/debian/pool/main/z/zabbix-release/zabbix-release_8.0-0.1%2Bdebian13_all.deb
dpkg -i zabbix-release_8.0-0.1+debian13_all.deb.2

#Installation de l'agent 
echo "[3/5] ➤ Installation de l'agent"
apt update
apt install zabbix-agent2 -y

#Ajout de l'IP du serveur du fichier conf de l'agent 
echo "[4/5] ➤ Ajout de l'IP du serveur du fichier conf de l'agent"
sed -i "s/^Server=.*/Server=${SERVER_IP}/" "$FICHIER_CONF"
sed -i "s/^ServerActive=.*/ServerActive=${SERVER_IP}/" "$FICHIER_CONF"

# Redémarrage de l'agent 
echo "[5/5] ➤ Redémarrage de l'agent"
systemctl restart zabbix-agent2.service
systemctl enable zabbix-agent2.service


