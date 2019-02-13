# По всем пунктам Labwork2
# 1.	Создайте сценарии *.ps1 для задач из labwork 2, проверьте их работоспостобность. Каждый сценарий должен иметь параметры.

# 1. Просмотреть содержимое ветви реeстра HKCU.
# script1.ps1 
Param
(
   $File = 'D:\!Valik\!Temp\Task1.txt'

)
cd HKCU:\
dir | Out-File $File 

# Переход к конкретной ветви реестра, например HKCU\Software\Microsoft\Windows\CurrentVersion\
# script1_1.ps1
Param
(
   $File = 'D:\!Valik\!Temp\Task1_1.txt'

)
Set-Location -Path HKCU:\Software\Microsoft\Windows\CurrentVersion
dir | Out-File $File

# Вывод содержимого \Software\Microsoft\Windows\CurrentVersion\Run
Param
(
   $File = 'D:\!Valik\!Temp\Task1_2.txt'

)
Get-Item -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run | Out-File $File

#2.	Создать, переименовать, удалить каталог на локальном диске

# 2.1 Создание каталога на локальном диске.
Param
(
   $File = 'D:\!Valik\!Temp\Task2_1.txt' 
   #$Folder = 'D:\!Valik\!Temp\!Folder'
)
New-Item -Path 'D:\!Valik\!Temp\!Folder' -ItemType "directory" | Out-File $File

# 2.2 Переименование каталога на жёстком диске.
cd D:\!Valik\!Temp\!Folder

# Создадим каталог Test
New-Item -Path 'D:\!Valik\!Temp\!Folder\Test' -ItemType "directory"

# Переименование Test
Param
(
   $File = 'D:\!Valik\!Temp\Task2_2.txt' 
)
Rename-Item -Path 'D:\!Valik\!Temp\!Folder\Test'-NewName Test_1
dir | Out-File $File

# 2.3 Удаление каталога Test_1
cd D:\!Valik\!Temp\

Param
(
   $File = 'D:\!Valik\!Temp\Task2_3.txt' 
)
Remove-Item D:\!Valik\!Temp\!Folder\Test_1
dir | Out-File $File















# 1.1. Сохранить в текстовый файл на диске список запущенных(!) служб. Просмотреть содержимое диска. Вывести содержимое файла в консоль PS.
$a = 0 
foreach ($b in $a) {
    Get-Service if ($b -eq "Running") {Write-Host $b}
}

 
# 2.	Работа с профилем
# 2.1.	Создать профиль

 New-Item -ItemType file -Path $PROFILE -force

 # Результат работы PowerShell
  <#PS C:\Users\Administrator> Test-Path $PROFILE
False
PS C:\Users\Administrator> New-Item -ItemType file -Path $PROFILE -force


    Directory: C:\Users\Administrator\Documents\WindowsPowerShell


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a----         13.02.19     14:26              0 Microsoft.PowerShell_profile.ps1
 #>

# Результат работы в PowerShellISE
 <#PS C:\Users\Administrator> New-Item -ItemType file -Path $PROFILE -force


    Directory: C:\Users\Administrator\Documents\WindowsPowerShell


Mode                LastWriteTime         Length Name                                                                                                                                         
----                -------------         ------ ----                                                                                                                                         
-a----         13.02.19     14:27              0 Microsoft.PowerShellISE_profile.ps1 
 #>

# 2.2. В профиле изненить цвета в консоли PowerShell

notepad $PROFILE

Get-ExecutionPolicy
<#PS C:\Users\Administrator> Get-ExecutionPolicy
Unrestricted
#>

# PowerShellISE c:\Users\Administrator\Documents\WindowsPowerShell\Microsoft.PowerShellISE_profile.ps1
<#(Get-Host).UI.RawUI.ForegroundColor = "green"
(Get-Host).UI.RawUI.BackgroundColor = "black"
Write-Host "Hello, Valentin!!!!"
#>
# PowerShell c:\Users\Administrator\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
<#(Get-Host).UI.RawUI.ForegroundColor = "green"
(Get-Host).UI.RawUI.BackgroundColor = "black"
Write-Host "Hello, Valentin!!!!"
#>

# 2.3. Создать несколько собственный алиасов В файле Microsoft.PowerShell_profile.ps1 дописываем следующие строчки
<#Set-Alias HelpMe Get-Help
Set-Alias Gt_Memb Get-Member
Set-Alias Gt_Proc Get-Process
#>
Get-Process

HelpMe

# 2.4. Создать несколько констант
#Дописываем в файл .ps1 профиля следующую строки

<#Set-Variable Ro -option Constant -Value 7.25
Set-Variable pi -option Constant -Value 3.14
Set-Variable Ad -option Constant -Value 10
#>

$ad


# 2.5. Изменить текущую папку

# Дописываем в файл .ps1 профиля следующую строку

<#Set-Location C:\#> 

# Призапуске консоли по умолчанию будет следующая строка PS C:\>

#2.6. Вывести приветсвие

# Дописываем в файл .ps1 профиля следующую строку

# Write-Host "Hello, Valentin!!!!"

# Вывод
<# Hello, Valentin!!!!
PS C:\>
#>

# 3. Получить список всех доступных модулей
# Получение списка модулей, установленных в местоположение по умолчанию
Get-Module -ListAvailable
# Модули, импортированные в сеанс PowerShell
Get-Module






