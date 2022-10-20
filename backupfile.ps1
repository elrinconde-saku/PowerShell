# Powershell script to zip files in a folder and send them to a remote server

$sourceFiles = get-childitem -path "C:\Users\User\Downloads" -recurse -include *.txt

$zipFile = "C:\Users\User\Downloads\test.zip"

$zip = new-object -com shell.application

$zip = $zip.NameSpace($zipFile)



