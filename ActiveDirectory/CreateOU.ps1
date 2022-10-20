# import data from CSV file
$AD= Import-Csv C:\Users\user\Desktop\ou.csv

foreach ($ou in $AD)
{
#Read data from each field in each row and assign the data to a variable as below

$name = $ou.name
$path = $ou.path

#Account will be created in the OU provided by the $OU variable read from the CSV file
New-ADOrganizationalUnit -DisplayName $name -Name $name -Path $path
}