Import-Module ActiveDirectory
Import-Module 'Microsoft.PowerShell.Security'

$users = Import-Csv -Delimiter ";" -Path "C:\scripts\import.csv"


foreach ($user in $users){

    $name = $user.firstName + " " + $user.lastName
    $fname = $user.firstName
    $lname = $user.lastName
    $login = $user.firstName + "." + $user.lastName
    $Uoffice = $user.office
    $Upassword = $user.password
    $dept = $user.department 


#********Ajout des utilisateurs de Lille dans leurs groupes********************

if ($Uoffice -eq "Lille" -and $dept -eq "Direction"){

    Add-ADGroupMember -Identity 'DirectionLille' -Members $login

}
elseif ($Uoffice -eq "Lille" -and $dept -eq "Traders"){

    Add-ADGroupMember -Identity 'TradersLille' -Members $login

}
elseif ($Uoffice -eq "Lille" -and $dept -eq "Secretary"){

    Add-ADGroupMember -Identity 'SecretaryLille' -Members $login

}
elseif ($Uoffice -eq "Lille" -and $dept -eq "Accounting"){

    Add-ADGroupMember -Identity 'AccountingLille' -Members $login

}
elseif ($Uoffice -eq "Lille" -and $dept -eq "Financial-Consultant"){

    Add-ADGroupMember -Identity 'Financial-ConsultantLille' -Members $login

}
elseif ($Uoffice -eq "Lille" -and $dept -eq "Sales"){

    Add-ADGroupMember -Identity 'SalesLille' -Members $login
} 


#********Ajout des users de Dax dans leurs groupes********************


if ($Uoffice -eq "Dax" -and $dept -eq "Direction"){

    Add-ADGroupMember -Identity 'DirectionDax' -Members $login

}
elseif ($Uoffice -eq "Dax" -and $dept -eq "Traders"){

    Add-ADGroupMember -Identity 'TradersDax' -Members $login

}
elseif ($Uoffice -eq "Dax" -and $dept -eq "Secretary"){

    Add-ADGroupMember -Identity 'SecretaryDax' -Members $login

}
elseif ($Uoffice -eq "Dax" -and $dept -eq "Accounting"){

    Add-ADGroupMember -Identity 'AccountingDax' -Members $login

}
elseif ($Uoffice -eq "Dax" -and $dept -eq "Financial-Consultant"){

    Add-ADGroupMember -Identity 'Financial-ConsultantDax' -Members $login

}
elseif ($Uoffice -eq "Dax" -and $dept -eq "Sales"){

    Add-ADGroupMember -Identity 'SalesDax' -Members $login

} 


#********Ajout des users de Annecy dans leurs groupes********************


if ($Uoffice -eq "Annecy" -and $dept -eq "Direction"){

    Add-ADGroupMember -Identity 'DirectionAnnecy' -Members $login

}
elseif ($Uoffice -eq "Annecy" -and $dept -eq "Traders"){

    Add-ADGroupMember -Identity 'TradersAnnecy' -Members $login

}
elseif ($Uoffice -eq "Annecy" -and $dept -eq "Secretary"){

    Add-ADGroupMember -Identity 'SecretaryAnnecy' -Members $login

}
elseif ($Uoffice -eq "Annecy" -and $dept -eq "Accounting"){

    Add-ADGroupMember -Identity 'AccountingAnnecy' -Members $login

}
elseif ($Uoffice -eq "Annecy" -and $dept -eq "Financial-Consultant"){

    Add-ADGroupMember -Identity 'Financial-ConsultantAnnecy' -Members $login

}
elseif ($Uoffice -eq "Annecy" -and $dept -eq "Sales"){

    Add-ADGroupMember -Identity 'SalesAnnecy' -Members $login

}
#********Ajout des users de Brest dans leurs groupes********************


if ($Uoffice -eq "Brest" -and $dept -eq "Direction"){

    Add-ADGroupMember -Identity 'DirectionBrest' -Members $login

}
elseif ($Uoffice -eq "Brest" -and $dept -eq "Traders"){

    Add-ADGroupMember -Identity 'TradersBrest' -Members $login

}
elseif ($Uoffice -eq "Brest" -and $dept -eq "Secretary"){

    Add-ADGroupMember -Identity 'SecretaryBrest' -Members $login

}
elseif ($Uoffice -eq "Brest" -and $dept -eq "Accounting"){

    Add-ADGroupMember -Identity 'AccountingBrest' -Members $login

}
elseif ($Uoffice -eq "Brest" -and $dept -eq "Financial-Consultant"){

    Add-ADGroupMember -Identity 'Financial-ConsultantBrest' -Members $login

}
elseif ($Uoffice -eq "Brest" -and $dept -eq "Sales"){

    Add-ADGroupMember -Identity 'SalesBrest' -Members $login

}
} #Accolade fermante de notre boucle – Fin de la boucle
 