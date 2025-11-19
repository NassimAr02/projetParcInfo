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

