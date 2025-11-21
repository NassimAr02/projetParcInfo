#!/bin/bash
# Installation du Plugin GLPI Inventory
# Github : NassimAr02

echo "Importation du plugin"
cd /var/www/html/glpi/plugins
wget https://github.com/glpi-project/glpi-inventory-plugin/releases/download/1.6.2/glpi-glpiinventory-1.6.2.tar.bz2
tar jxvf glpi-glpiinventory-1.6.2.tar.bz2
chown apache:apache glpiinventory -R
rm -f glpi-glpiinventory-1.6.2.tar.bz2