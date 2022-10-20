$startFolder = "C:\Program Files\7-Zip\7z.dll";
$totalSize = 0; 
$colItems = Get-ChildItem $startFolder 
#$credentials = Get-Credential

foreach ($i in $colItems) 
{ 
    $subFolderItems = Get-ChildItem $i.FullName -recurse -force | Where-Object {$_.PSIsContainer -eq $false} | Measure-Object -property Length -sum | Select-Object Sum 
    $totalSize = $totalSize + $subFolderItems.sum / 1MB 
   
} 

$startFolder + " | " + "{0:N2}" -f ($totalSize) + " MB" 


if($totalSize -gt 1){ 
    
    
    Send-MailMessage –From contoso@contoso.com –To contoso@contoso.com –Subject "Tamaño base de datos" –Body "Archivo $startFolder supero umbral de tamano $totalSize " -SmtpServer smtp.office365.com -Credential "contoso@contoso.com" -UseSsl -Port 587

}