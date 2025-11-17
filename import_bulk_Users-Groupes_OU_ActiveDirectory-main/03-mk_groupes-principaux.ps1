#********Création des Groupes*********

New-ADGroup -Name Direction -GroupScope Global -GroupCategory Security -Path "ou=Employés,dc=dubois,dc=local"

New-ADGroup -Name Sales -GroupScope Global -GroupCategory Security -Path "ou=Employés,dc=dubois,dc=local"
New-ADGroup -Name Traders -GroupScope Global -GroupCategory Security -Path "ou=Employés,dc=dubois,dc=local"
New-ADGroup -Name Secretary -GroupScope Global -GroupCategory Security -Path "ou=Employés,dc=dubois,dc=local"
New-ADGroup -Name Accounting -GroupScope Global -GroupCategory Security -Path "ou=Employés,dc=dubois,dc=local"
New-ADGroup -Name Financial-Consultant -GroupScope Global -GroupCategory Security -Path "ou=Employés,dc=dubois,dc=local"