# projetParcInfo
Projet de modernisation d'une infrastructure réalisé en formation AIS

# Ajout des comptes Utilisateurs dans l'AD 

Executez les scripts un par un dans l'ordre des numéros

# Installation de zabbix 7.4 dans une debian 13

1) Créer une machine debian 13 en core à l'aide de l'iso que vous aurez préalablement téléchargé
    Ne Pas oublier d'activer le server SSH et de désactiver GNOME et l'interface graphique
    Vous pouvez supprimer l'interface graphique si vous l'avez installer sans le vouloir en entrant :
    
    ```bash
    apt-get purge gdm3
    ```


2) Depuis un terminal powershell de votre machine locale envoyer le fichier sur le dossier /home/nomHote
    ```shell
    scp "chemindufichier\install_zabbix_debian13.sh loginMachine@ip_machine:/home/nomHote
    ```
3) Donnez les droits d'éxécution et éxécuter le script d'installation 
    ```bash
    chmod +x \home\nomHote\install_zabbix_debian13.sh
    .\home\nomHote\install_zabbix_debian13.sh
    ```
