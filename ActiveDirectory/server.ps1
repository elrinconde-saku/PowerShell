# scrip para listar servidores en directorio activo y moverlos a una ou especifica

# Import Active Directory Module
Import-Module ActiveDirectory

# list all servers in active directory
$server = Get-ADComputer -Filter * -Properties * -SearchBase "DC=contoso,DC=contoso,DC=local" | Select-Object Name,OperatingSystem,DistinguishedName

# loop through each server
foreach ($server in $server)
{
    # check if the server is a windows server
    if ($server.OperatingSystem -like "*Windows Server 2012*")
    {
        # Move the computer to the new OU
        Move-ADObject -Identity $server.DistinguishedName -TargetPath "OU=Windows Server 2012,OU=Servidores,DC=contoso,DC=contoso,DC=local"
    }elseif (($server.OperatingSystem -like "*Windows Server 2016*")) {
        # Move the computer to the new OU
        Move-ADObject -Identity $server.DistinguishedName -TargetPath "OU=Windows Server 2016,OU=Servidores,DC=contoso,DC=contoso,DC=local"
    }elseif (($server.OperatingSystem -like "*Windows Server 2019*")) {
        # Move the computer to the new OU
        Move-ADObject -Identity $server.DistinguishedName -TargetPath "OU=Windows Server 2019,OU=Servidores,DC=contoso,DC=contoso,DC=local"
    }
}
