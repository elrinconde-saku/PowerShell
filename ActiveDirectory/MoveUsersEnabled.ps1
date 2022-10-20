# Mover usuarios activos de directorio activo a OU 

# Import Active Directory Module
Import-Module ActiveDirectory

# Get all users in the domain
$users = Get-ADUser -Filter * -Properties * -SearchBase "DC=contoso,DC=contoso,DC=local"

# Loop through each user
foreach ($user in $users)
{
    # Check if the user is enabled
    if ($user.Enabled -eq $true)
    {
        # Move the user to the new OU
        Move-ADObject -Identity $user.DistinguishedName -TargetPath "CN=Users,DC=contoso,DC=contoso,DC=local"
    }
}








