# Conexion segura SSL
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

#Connect to Azure AD
Connect-MsolService
  
$users = Import-Csv D:\Personal\Scrip\PowerShell\user.csv  
foreach ($user in $users)
  
{ 
    $st = New-Object -TypeName Microsoft.Online.Administration.StrongAuthenticationRequirement 
    $st.RelyingParty = "*" 
    $st.State = "Enabled" 
    $sta = @($st) 
    Set-MsolUser -UserPrincipalName $user.UserPrincipalName -StrongAuthenticationRequirements $sta 
}
  
Read-Host -Prompt "Press Enter to exit"