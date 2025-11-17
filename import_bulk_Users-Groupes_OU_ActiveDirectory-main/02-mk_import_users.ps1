Import-Module ActiveDirectory
Import-Module 'Microsoft.PowerShell.Security'

$users = Import-Csv -Delimiter ";" -Path "C:\scripts\import.csv"
#*******Ajout de chaque utilisateur dans son OU spécifique*******

foreach ($user in $users){
    
    $name = $user.firstName + " " + $user.lastName
    $fname = $user.firstName
    $lname = $user.lastName
    $login = $user.firstName + "." + $user.lastName
    $Uoffice = $user.office
    $Upassword = $user.password
    $dept = $user.department
    

    switch($user.office){
        "Lille" {$office = "OU=Lille,OU=Employés,DC=dubois,DC=local"}
        "Brest" {$office = "OU=Brest,OU=Employés,DC=dubois,DC=local"}
        "Dax" {$office = "OU=Dax,OU=Employés,DC=dubois,DC=local"}
        "Annecy" {$office = "OU=Annecy,OU=Employés,DC=dubois,DC=local"}
        default {$office = $null}    
    }
    
     try {
            New-ADUser -Name $name -SamAccountName $login -UserPrincipalName $login -DisplayName $name -GivenName $fname -Surname $lname -AccountPassword (ConvertTo-SecureString $Upassword -AsPlainText -Force) -City $Uoffice -Path $office -Department $dept -Enabled $true
            echo "Utilisateur ajouté : $name"
          
           
        } catch{
            echo "utilisateur non ajouté : $name"
       }   

   }