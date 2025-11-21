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

# Installation de GLPI

1) Créer une machine debian 13 en core à l'aide de l'iso que vous aurez préalablement téléchargé
    Ne Pas oublier d'activer le server SSH et de désactiver GNOME et l'interface graphique
    Vous pouvez supprimer l'interface graphique si vous l'avez installer sans le vouloir en entrant :
    
    ```bash
    apt-get purge gdm3
    ```


2) Depuis un terminal powershell de votre machine locale envoyer le fichier sur le dossier /home/nomHote
    ```shell
    scp "chemindufichier\install_glpi_debian13.sh loginMachine@ip_machine:/home/nomHote
    ```
3) Donnez les droits d'éxécution et éxécuter le script d'installation 
    ```bash
    chmod +x \home\nomHote\install_glpi_debian13.sh
    .\home\nomHote\install_glpi_debian13.sh
    ```
