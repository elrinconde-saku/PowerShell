#Conexion segura SSL
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

#Sitio de SharePoint
$SPOsite = "https://contoso.com/sites/Repositorio";

#conexion con sitio de SharePoint
Connect-PnPOnline -Url $SPOsite
