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


#********Ajout des utilisateurs de Paris dans leurs groupes********************

if ($Uoffice -eq "Paris" -and $dept -eq "Direction"){

    Add-ADGroupMember -Identity 'DirectionParis' -Members $login

}
elseif ($Uoffice -eq "Paris" -and $dept -eq "Traders"){

    Add-ADGroupMember -Identity 'TradersParis' -Members $login

}
elseif ($Uoffice -eq "Paris" -and $dept -eq "Secretary"){

    Add-ADGroupMember -Identity 'SecretaryParis' -Members $login

}
elseif ($Uoffice -eq "Paris" -and $dept -eq "Accounting"){

    Add-ADGroupMember -Identity 'AccountingParis' -Members $login

}
elseif ($Uoffice -eq "Paris" -and $dept -eq "Financial-Consultant"){

    Add-ADGroupMember -Identity 'Financial-ConsultantParis' -Members $login

}
elseif ($Uoffice -eq "Paris" -and $dept -eq "Sales"){

    Add-ADGroupMember -Identity 'SalesParis' -Members $login
} 


#********Ajout des users de Berlin dans leurs groupes********************


if ($Uoffice -eq "Berlin" -and $dept -eq "Direction"){

    Add-ADGroupMember -Identity 'DirectionBerlin' -Members $login

}
elseif ($Uoffice -eq "Berlin" -and $dept -eq "Traders"){

    Add-ADGroupMember -Identity 'TradersBerlin' -Members $login

}
elseif ($Uoffice -eq "Berlin" -and $dept -eq "Secretary"){

    Add-ADGroupMember -Identity 'SecretaryBerlin' -Members $login

}
elseif ($Uoffice -eq "Berlin" -and $dept -eq "Accounting"){

    Add-ADGroupMember -Identity 'AccountingBerlin' -Members $login

}
elseif ($Uoffice -eq "Berlin" -and $dept -eq "Financial-Consultant"){

    Add-ADGroupMember -Identity 'Financial-ConsultantBerlin' -Members $login

}
elseif ($Uoffice -eq "Berlin" -and $dept -eq "Sales"){

    Add-ADGroupMember -Identity 'SalesBerlin' -Members $login

} 


#********Ajout des users de Londres dans leurs groupes********************


if ($Uoffice -eq "Londres" -and $dept -eq "Direction"){

    Add-ADGroupMember -Identity 'DirectionLondres' -Members $login

}
elseif ($Uoffice -eq "Londres" -and $dept -eq "Traders"){

    Add-ADGroupMember -Identity 'TradersLondres' -Members $login

}
elseif ($Uoffice -eq "Londres" -and $dept -eq "Secretary"){

    Add-ADGroupMember -Identity 'SecretaryLondres' -Members $login

}
elseif ($Uoffice -eq "Londres" -and $dept -eq "Accounting"){

    Add-ADGroupMember -Identity 'AccountingLondres' -Members $login

}
elseif ($Uoffice -eq "Londres" -and $dept -eq "Financial-Consultant"){

    Add-ADGroupMember -Identity 'Financial-ConsultantLondres' -Members $login

}
elseif ($Uoffice -eq "Londres" -and $dept -eq "Sales"){

    Add-ADGroupMember -Identity 'SalesLondres' -Members $login

}

} #Accolade fermante de notre boucle – Fin de la boucle
 