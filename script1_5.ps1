Get-HotFix | Export-Csv C:\M2T2_KALLAUR\HotFix.csv
Get-Item -Path  HKLM:\SOFTWARE\Microsoft | Export-Clixml -Path C:\M2T2_KALLAUR\HKLM.xml
Get-Content -Path C:\M2T2_KALLAUR\HotFix.csv | Write-Host -ForegroundColor DarkMagenta 
Get-Content -Path C:\M2T2_KALLAUR\HKLM.xml | Write-Host -ForegroundColor DarkRed