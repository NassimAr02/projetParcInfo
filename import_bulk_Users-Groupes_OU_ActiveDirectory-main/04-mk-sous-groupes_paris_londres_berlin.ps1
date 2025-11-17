#*********************Groupes sous Paris************************

New-ADGroup -Name DirectionParis -GroupScope Global -GroupCategory Security -Path "ou=Paris,ou=Employés,dc=formation,dc=lan"
New-ADGroup -Name SalesParis -GroupScope Global -GroupCategory Security -Path "ou=Paris,ou=Employés,dc=formation,dc=lan"
New-ADGroup -Name TradersParis -GroupScope Global -GroupCategory Security -Path "ou=Paris,ou=Employés,dc=formation,dc=lan"
New-ADGroup -Name SecretaryParis -GroupScope Global -GroupCategory Security -Path "ou=Paris,ou=Employés,dc=formation,dc=lan"
New-ADGroup -Name AccountingParis -GroupScope Global -GroupCategory Security -Path "ou=Paris,ou=Employés,dc=formation,dc=lan"
New-ADGroup -Name Financial-ConsultantParis -GroupScope Global -GroupCategory Security -Path "ou=Paris,ou=Employés,dc=formation,dc=lan"


#*********************Groupes sous Berlin************************

New-ADGroup -Name DirectionBerlin -GroupScope Global -GroupCategory Security -Path "ou=Berlin,ou=Employés,dc=formation,dc=lan"
New-ADGroup -Name SalesBerlin -GroupScope Global -GroupCategory Security -Path "ou=Berlin,ou=Employés,dc=formation,dc=lan"
New-ADGroup -Name TradersBerlin -GroupScope Global -GroupCategory Security -Path "ou=Berlin,ou=Employés,dc=formation,dc=lan"
New-ADGroup -Name SecretaryBerlin -GroupScope Global -GroupCategory Security -Path "ou=Berlin,ou=Employés,dc=formation,dc=lan"
New-ADGroup -Name AccountingBerlin -GroupScope Global -GroupCategory Security -Path "ou=Berlin,ou=Employés,dc=formation,dc=lan"
New-ADGroup -Name Financial-ConsultantBerlin -GroupScope Global -GroupCategory Security -Path "ou=Berlin,ou=Employés,dc=formation,dc=lan"

#*********************Groupes sous Londres************************

New-ADGroup -Name DirectionLondres -GroupScope Global -GroupCategory Security -Path "ou=Londres,ou=Employés,dc=formation,dc=lan"
New-ADGroup -Name SalesLondres -GroupScope Global -GroupCategory Security -Path "ou=Londres,ou=Employés,dc=formation,dc=lan"
New-ADGroup -Name TradersLondres -GroupScope Global -GroupCategory Security -Path "ou=Londres,ou=Employés,dc=formation,dc=lan"
New-ADGroup -Name SecretaryLondres -GroupScope Global -GroupCategory Security -Path "ou=Londres,ou=Employés,dc=formation,dc=lan"
New-ADGroup -Name AccountingLondres -GroupScope Global -GroupCategory Security -Path "ou=Londres,ou=Employés,dc=formation,dc=lan"
New-ADGroup -Name Financial-ConsultantLondres -GroupScope Global -GroupCategory Security -Path "ou=Londres,ou=Employés,dc=formation,dc=lan"
 