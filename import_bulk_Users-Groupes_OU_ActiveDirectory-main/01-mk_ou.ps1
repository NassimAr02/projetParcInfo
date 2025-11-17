Import-Module ActiveDirectory
Import-Module 'Microsoft.PowerShell.Security'

$users = Import-Csv -Delimiter ";" -Path "C:\scripts\import.csv"

#********************Création des OU********************************

New-ADOrganizationalUnit -Name "Employés" -Path "dc=formation,dc=lan"
New-ADOrganizationalUnit -Name "Londres" -Path "ou=Employés,dc=formation,dc=lan"
New-ADOrganizationalUnit -Name "Paris" -Path "ou=Employés,dc=formation,dc=lan"
New-ADOrganizationalUnit -Name "Berlin" -Path "ou=Employés,dc=formation,dc=lan"