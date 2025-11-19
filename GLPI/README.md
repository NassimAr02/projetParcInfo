# Installer Glpi




# Mettre à jour GLPI

Si vous devez mettre à jour votre version de glpi :

### Supprimer la version actuel :

```bash
rm -Rf /var/www/html/glpi/
```

### Télécharger la nouvelle version de GLPI (ici 11.0.2):

```bash
setfacl -R -m u:www-data:rwx /var/www/html/glpi/Files/
setfacl -R -m g:www-data:rwx /var/www/html/glpi/Files/
cd /tmp
wget https://github.com/glpi-project/glpi/releases/download/11.0.2/glpi-11.0.2.tgz
tar -xzvf glpi-11.0.2.tgz
mv glpi /var/www/html/glpi
```
##### Si vous avez un problème de droit 

```bash
setfacl -R -m u:www-data:rwx /var/www/html/glpi/config/
setfacl -R -m g:www-data:rwx /var/www/html/glpi/config/
```

Dans l'interface Web il vous suffira ensuite de cliquer sur mettre à jour et suivre les étapes.

### Installer le plugin glpi inventory (version 1.6.2): 

```bash
cd /var/www/html/glpi/plugins
wget https://github.com/glpi-project/glpi-inventory-plugin/releases/download/1.6.2/glpi-glpiinventory-1.6.2.tar.bz2
tar jxvf glpi-glpiinventory-1.6.2.tar.bz2
chown votreUser:votreUser glpiinventory -R
rm -f glpi-glpiinventory-1.6.2.tar.bz2
```

Installer et activer ensuite votre plugins dans configuration -> Plugins