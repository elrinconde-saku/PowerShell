# Eliminar Ou de Active Directory que no tengan usuarios, equipos o grupos y desactivar la protección de la OU

# importar el módulo Active Directory
Import-Module ActiveDirectory

# Obtener la lista de OUs
$OUs = Get-ADOrganizationalUnit -Filter * -SearchBase "OU=OUs,DC=contoso,DC=com"

# Recorrer la lista de OUs
foreach ($OU in $OUs) {
    # Obtener la lista de usuarios, equipos y grupos de la OU
    $Users = Get-ADUser -Filter * -SearchBase $OU.DistinguishedName
    $Computers = Get-ADComputer -Filter * -SearchBase $OU.DistinguishedName
    $Groups = Get-ADGroup -Filter * -SearchBase $OU.DistinguishedName

    # Si no hay usuarios, equipos o grupos en la OU
    if ($Users.Count -eq 0 -and $Computers.Count -eq 0 -and $Groups.Count -eq 0) {
        # Desactivar la protección de la OU
        Set-ADOrganizationalUnit -Identity $OU.DistinguishedName -ProtectedFromAccidentalDeletion $false

        # Eliminar la OU
        Remove-ADOrganizationalUnit -Identity $OU.DistinguishedName -Confirm:$false
    }
}