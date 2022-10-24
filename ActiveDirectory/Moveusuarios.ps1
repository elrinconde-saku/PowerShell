# importar usuarios desde un archivo csv
$AD= Import-Csv C:\Users\admindav\Desktop\ou.csv

# Loop through each user in the CSV file
foreach ($ou in $AD){
    #Read data from each field in each row and assign the data to a variable as below
    $name = $ou.name
    $path = $ou.path

    # the user changes organizational unit provided by the variable $OU read from the csv file
    Move-ADObject -Identity $name -TargetPath $path
}

