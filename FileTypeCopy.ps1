<#$driveLetter= read-host -prompt 'What is the drive letter?'
write-host "Drive letter is $driveLetter "

ls C:\Users\Tj\Desktop\scripttest
#>
Clear-Host


Write-Host "This will copy all files of a certain type (i.e .txt .mp4 .pdf) from one folder to another folder (if the folder does not exist it will be created)"

$firstPath = read-host -Prompt "`nWhat is the file path for the files?"
try {
    Set-Location $firstPath -ErrorAction Stop > $null
    $firstPath = null
}
catch {
    Write-output "`nNow Exiting... Please Check first path entered, it may be incorrect"
    Start-Sleep -Seconds 3
    exit 1
}

$fileType = Read-Host -Prompt "What is the file type for the files? (include the period)"
$secondPath = Read-Host -Prompt "What is the destination file path?"

mkdir $secondPath -ErrorAction SilentlyContinue > $null
try {
    Set-Location $secondPath -ErrorAction Stop > $null
    $secondPath = null
}
catch {
    Write-output "`nNow Exiting... Please Check Second path entered, it may be incorrect"
    Start-Sleep -Seconds 3
    exit 1
}
Get-ChildItem $firstPath\*$fileType -Recurse | Copy-Item -Destination $secondPath -ErrorAction Stop

Clear-Host
Get-ChildItem $secondPath
