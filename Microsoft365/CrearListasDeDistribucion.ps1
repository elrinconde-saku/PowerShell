# Conexion SSl 
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Realizar la conexion con Exchange Online
Set-ExecutionPolicy RemoteSigned
Install-Module -Name ExchangeOnlineManagement 
Import-Module ExchangeOnlineManagement; Get-Module ExchangeOnlineManagement # Solo se ejecuta una vez en el equipo, esto instala el modulo ExchangeOnlineManagemen
Connect-ExchangeOnline


#Para visualizar todas las Listas de Distribución:
Get-DistributionGroup

#Para visualizar los miembros de una Lista de Distribución:
get-DistributionGroupMember -Identity "Teletrabajo Admin" | Sort-Object -Property @{ Expression = 'Name'; Ascending = $true }  | Format-Table -Property Name, RecipientType      

# Linea para crear grupo de distribucion y agregar miembros masivos
New-DistributionGroup -Name "Teletrabajo Admin" -Members "Se agregar cuentas de correo delimitado por coma"
