# Переход к конкретной ветви реестра, например HKCU\Software\Microsoft\Windows\CurrentVersion\
#script1_1.ps1
Param
(
   $File='D:\!Valik\!Temp\Task1_1.txt'

)
Set-Location -Path HKCU:\Software\Microsoft\Windows\CurrentVersion
dir | Out-File $File