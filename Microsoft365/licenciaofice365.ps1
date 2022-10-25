# Consultar licencias adquiridas por choucair
Get-MsolAccountSku

# Listar usuario que tienen x tipo de licencia
Get-MsolUser -all | Where-Object {($_.licenses).AccountSkuId -match "POWER_BI_PRO"}
