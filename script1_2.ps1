# Вывод содержимого \Software\Microsoft\Windows\CurrentVersion\Run
Param
(
   $File='D:\!Valik\!Temp\Task1_2.txt'

)
Get-Item -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run | Out-File $File