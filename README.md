# projetParcInfo
Projet de modernisation d'une infrastructure réalisé en formation AIS

https://trello.com/invite/b/691aea06a00c88cfbb9c6693/ATTI2a3295148a4b7ae5063c1414740c01fd63A7A4DB/projetparcinfo

# Diverse commandes Linux 

## Donner une adresse statique:

 ```bash
    nano /etc/network/interfaces
```

### Dans le fichier interfaces :

```bash
    auto nomInterface
    iface nomInterface inet static
    address ipInterface
    netmask masqueReseau
    network adresseReseau
    broadcast broadcastReseau
```

### Redémarrer l'interface :

```bash
systemctl restart networking
```

Si la configuration ne s'est pas appliqué redémarrer la machine 

## Passer en AZERTY 

### Lancer l'éditeur de configuration du clavier

```bash
sudo dpkg-reconfigure keyboard-configuration
```
    
 
Choisissez PC générique 105 touches
### Redémarrer pour appliquer la conf

```bash
sudo service keyboard-setup restart
sudo reboot now
```      


## Mettre un User dans le groupe Sudo (depuis root)

```bash
usermod -aG sudo nom_utilisateur
exit
logout
```
## Installer SSH (S'il n'est pas présent)

```bash 
apt install openssh-server
```
## Changer le DNS 

```bash
sudo nano /etc/resolv.conf
```
