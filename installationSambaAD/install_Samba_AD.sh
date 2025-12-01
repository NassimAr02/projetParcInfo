#!/bin/bash
#Installation Automatisé d'un Serveur AD Samba sur debian 13
#par nassim.arrasspro@gmail.com

echo "[1/8] ➤ Mise à jour des dépôts et installation de Samba"
sleep 3
apt update
apt -y install samba-ad-dc smbclient samba-ad-dc-web

echo "[2/8] ➤ Sauvegarde du fichier de configuration existant"
sleep 3
mv /etc/samba/smb.conf /etc/samba/smb.conf.org


REALM="dubois.local"
DOMAIN="DUBOIS"
PASS="operations"
SERVERNAME="vbox"
DNSFWD="none" # Si vous séparer votre DNS de votre AD entrez une adresse
DNSBACKEND="SAMBA_INTERNAL" # SAMBA_INTERNAL, BIND9_FLATFILE, BIND9_DLZ, NONE
SERVEROLE="dc" # dc, member, standalone
FOREST=$REALM # Sauf si vous souhaitez créer une forêt

echo "[3/8] ➤ Provisionnement du domaine AD"
sleep 3
samba-tool domain provision \
    --realm=$REALM \
    --domain=$DOMAIN \
    --server-role=$SERVEROLE \
    --dns-backend=$DNSBACKEND \
    --dns-forwarder=$DNSFWD \
    --adminpass="$PASS" \
    --non-interactive

echo "[4/8] ➤ Modification du fichier smb.conf"
sleep 3

cat <<EOF > /etc/samba/smb.conf 
[global]
        # dns forwarder = 10.0.0.10
        netbios name = $SERVERNAME
        realm = $REALM
        server role = active directory domain controller
        workgroup = $DOMAIN
        # add the line in [global] section
        ad dc functional level = 2016
EOF
echo "[5/8] ➤ Configuration Kerberos et services Samba"
sleep 3

cp  /var/lib/samba/private/krb5.conf /etc/
systemctl disable --now smbd nmbd winbind
systemctl mask smbd nmbd winbind
systemctl unmask samba-ad-dc
systemctl enable --now samba-ad-dc

echo "[6/8] ➤ Vérification des informations du domaine"
sleep 3

samba-tool domain info $SERVERNAME.$REALM 
samba-tool drs showrepl

# Pause jusqu'à ce que l'utilisateur appuie sur une touche
read -n 1 -s -r -p "Appuyez sur une touche pour continuer..."
echo ""
echo "[7/8] ➤ Vérification et élévation du niveau fonctionnel"

sleep 3
# Vérifier les noveau du domaine et de la forêt
samba-tool domain level show
read -n 1 -s -r -p "Appuyez sur une touche pour continuer..."
echo ""

echo "[INFO] Préparation du domaine pour un niveau fonctionnel 2022..."
samba-tool domain functionalprep --function-level=2022
echo "[INFO] Élévation du niveau du domaine et de la forêt à 2022..."
samba-tool domain level raise --domain-level=2022 --forest-level=2022
echo "[OK] Niveau fonctionnel du domaine et de la forêt mis à jour"
samba-tool domain level show
read -n 1 -s -r -p "Appuyez sur une touche pour continuer..."
echo ""

echo "[8/8] ➤ Création d'un utilisateur de test"
sleep 3
# User de test
USERNAME="test"
PASSWORD="Password123!"

samba-tool user create $USERNAME $PASSWORD --given-name="TEST" --surname="test" --description="Compte utilisateur pour Test" --must-change-at-next-login=no
echo "[OK] Utilisateur $USERNAME créé avec succès"
echo ""
# # ou pour un  dc secondaire 
# DOMAIN="nomDomaine"
# ADMINAD="nomUserAdminAD"
# MDPADMINAD="mdpAdminAD"
# REALM="exemple.local"
# samba-tool domain join $REALM DC \
#     --domain=$DOMAIN \
#     --username=$ADMINAD \
#     --password=$MDPADMINAD \
#     --dns-backend=SAMBA_INTERNAL \
#     --non-interactive