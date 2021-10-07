$temp_path = "C:\"
$installer_url = "https://download.visualstudio.microsoft.com/download/pr/a0f49856-eec9-4962-8d81-b09af6be9435/1d5fc0083b7f7e10ebed181329ca88ae/dotnet-hosting-5.0.9-win.exe"
$installer_file = $temp_path + [System.IO.Path]::GetFileName( $installer_url )
 
Try
{
   add-windowsfeature web-server -includeallsubfeature
   Invoke-WebRequest -Uri $installer_url -OutFile $installer_file
 
$args = New-Object -TypeName System.Collections.Generic.List[System.String]
$args.Add("/quiet")
$args.Add("/norestart")
Start-Process -FilePath $installer_file -ArgumentList $args -NoNewWindow -Wait -PassThru
 
}
Catch
{
   Write-Output ( $_.Exception.ToString() )
   Break
}