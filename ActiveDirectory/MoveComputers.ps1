# move computers from ou to another ou

# Import Active Directory Module
Import-Module ActiveDirectory

# Get all computers in the domain
$computers = Get-ADComputer -Filter * -Properties * -SearchBase "DC=contoso,DC=contoso,DC=local"

# Loop through each computer
foreach ($computer in $computers)
{
    # Check if the computer is enabled
    if ($computer.Enabled -eq $true)
    {
        # Move the computer to the new OU
        Move-ADObject -Identity $computer.DistinguishedName -TargetPath "DC=contoso,DC=contoso,DC=local"
    }
}