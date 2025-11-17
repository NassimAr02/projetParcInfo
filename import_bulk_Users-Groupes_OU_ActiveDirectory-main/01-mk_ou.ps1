Import-Module ActiveDirectory
Import-Module 'Microsoft.PowerShell.Security'

$users = Import-Csv -Delimiter ";" -Path "C:\scripts\import.csv"

#********************Création des OU********************************

New-ADOrganizationalUnit -Name "Employés" -Path "dc=dubois,dc=local"
New-ADOrganizationalUnit -Name "Lille" -Path "ou=Employés,dc=dubois,dc=local"
New-ADOrganizationalUnit -Name "Dax" -Path "ou=Employés,dc=dubois,dc=local"
New-ADOrganizationalUnit -Name "Annecy" -Path "ou=Employés,dc=dubois,dc=local"
New-ADOrganizationalUnit -Name "Brest" -Path "ou=Employés,dc=dubois,dc=local"