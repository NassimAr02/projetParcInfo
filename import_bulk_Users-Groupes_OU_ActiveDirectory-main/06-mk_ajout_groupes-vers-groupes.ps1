#Ajout des groupes dans les groupes

Add-ADGroupMember -Identity 'Direction' -Members DirectionLille,DirectionAnnecy,DirectionDax,DirectionBrest
Add-ADGroupMember -Identity 'Sales' -Members SalesLille,SalesAnnecy,SalesDax,SalesBrest
Add-ADGroupMember -Identity 'Traders'-Members TradersLille,TradersAnnecy,TradersDax,TradersBrest
Add-ADGroupMember -Identity 'Secretary' -Members SecretaryLille,SecretaryAnnecy,SecretaryDax,SecretaryBrest
Add-ADGroupMember -Identity 'Accounting'-Members AccountingLille,AccountingAnnecy,AccountingDax,AccountingBrest
Add-ADGroupMember -Identity 'Financial-Consultant' -Members Financial-ConsultantLille,Financial-ConsultantAnnecy,Financial-ConsultantDax,Financial-ConsultantBrest