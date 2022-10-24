#Conexion segura SSL
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

#Rango de fechas para los archivos que se van a recuperar
$Date1 ="06/24/2022, 00:01:00 "; $Date2 ="06/25/2022, 23:59:00 ";

#Sitio de SharePoint
$SPOsite = "https://contoso.com/sites/";

#Cuenta de usuario que elimino los archivos.
$DeletionUser = "contoso@contoso"

# Instalar modulo, esto se hace siempre y caundo no este instalado (solo se realiza una vez)
 Install-Module -Name PnP.PowerShell -Force

#conexion con SharePoint
Connect-PnPOnline -Url $SPOsite

#Realizar consentimiento
Register-PnPManagementShellAccess

# Proceso de recuperacion desde la papelera de Sharepoint por fecha y usuario.
Get-PnPRecycleBinItem | WHERE {($_.DeletedDate -gt $Date1 -and $_.DeletedDate -lt $Date2) -and ($_.DeletedByEmail -eq $DeletionUser)} | Restore-PnPRecycleBinItem -force

Get-PnPRecycleBinItem | WHERE {($_.DeletedByEmail -eq $DeletionUser)}
