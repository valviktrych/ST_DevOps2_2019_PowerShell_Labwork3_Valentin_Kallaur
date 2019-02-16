# По всем пунктам Labwork2
# 1.	Создайте сценарии *.ps1 для задач из labwork 2, проверьте их работоспостобность. Каждый сценарий должен иметь параметры.

# 1. Просмотреть содержимое ветви реeстра HKCU.
# script1.ps1 
Param (
   $File = 'D:\!Valik\!Temp\Task1.txt'

)
cd HKCU:\
dir | Out-File $File 

# Переход к конкретной ветви реестра, например HKCU\Software\Microsoft\Windows\CurrentVersion\
# script1_1.ps1
Param (
   $File = 'D:\!Valik\!Temp\Task1_1.txt'

)
Set-Location -Path HKCU:\Software\Microsoft\Windows\CurrentVersion
dir | Out-File $File

# Вывод содержимого \Software\Microsoft\Windows\CurrentVersion\Run
Param (
   $File = 'D:\!Valik\!Temp\Task1_2.txt'

)
Get-Item -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run | Out-File $File

#2.	Создать, переименовать, удалить каталог на локальном диске

# 2.1 Создание каталога на локальном диске.
Param (
   $File = 'D:\!Valik\!Temp\Task2_1.txt' 
   #$Folder = 'D:\!Valik\!Temp\!Folder'
)
New-Item -Path 'D:\!Valik\!Temp\!Folder' -ItemType "directory" | Out-File $File

# 2.2 Переименование каталога на жёстком диске.
cd D:\!Valik\!Temp\!Folder

# Создадим каталог Test
New-Item -Path 'D:\!Valik\!Temp\!Folder\Test' -ItemType "directory"

# Переименование Test
Param (
   $File = 'D:\!Valik\!Temp\Task2_2.txt' 
)
Rename-Item -Path 'D:\!Valik\!Temp\!Folder\Test'-NewName Test_1
dir | Out-File $File

# 2.3 Удаление каталога Test_1
cd D:\!Valik\!Temp\

Param (
   $File = 'D:\!Valik\!Temp\Task2_3.txt' 
)
Remove-Item D:\!Valik\!Temp\!Folder\Test_1
dir | Out-File $File

# 3. Создать папку C:\M2T2_ФАМИЛИЯ. Создать диск ассоциированный с папкой C:\M2T2_ФАМИЛИЯ.
# 3.1 Создание папки C:\M2T2_KALLAUR
Param (
        [string]$Path = 'C:\M2T2_KALLAUR'
)
New-Item -Path $Path -ItemType "directory"

# 3.2 Создание диска, ассоциированного с папкой C:\M2T2_KALLAUR
Param (
    [string]$DriveName = 'M2T2'
)
New-PSDrive -Name $DriveName -PSProvider FileSystem -Root "C:\M2T2_KALLAUR" -Description "Maps to M2T2"


# 3.2.1 Просмотр результата
Param (
    [string]$DriveName = 'M2T2'
)
Get-PSDrive -Name $DriveName

#4.	Сохранить в текстовый файл на созданном диске список запущенных(!) служб. Просмотреть содержимое диска. Вывести содержимое файла в консоль PS.

#4.1 Сохраняем в текстовый файл Services.txt список запущенных служб на созданном диске M2T2.
Param (
    [string]$File = 'M2T2:\Services.txt'
    )
Get-Service | Where-Object {$_.Status -eq "Running"} | Out-File -FilePath $File

#4.2 Просмотреть содержимое диска.

dir M2T2:

#4.3 Вывести содержимое файла в консоль PS.
Param (
    $File = 'Services.txt'
)
Get-Content M2T2:\$File

#5.	Просуммировать все числовые значения переменных текущего сеанса.
Param (
    #[parameter(Mandatory=$true,ValueFromPipeline=$true)]
    $Column = 'Value'
)
$sum = 0
foreach ($_ in $V = Get-Variable | Select-Object $Column | Where-Object {$_.Value -is [int]} ) {
    
    $sum += $_.Value
    
}
Write-Host("Total sum: $sum")

#6.	Вывести список из 6 процессов занимающих дольше всего процессор.
Param (
    $Column1 = 'CPU',
    $Column2 = 'ProcessName'
)
Get-Process | Select-Object $Column1, $Column2 | Sort-Object $Column1 -Descending | Select-Object $Column1 -first 6

#7.	Вывести список названий и занятую виртуальную память (в Mb) каждого процесса, разделённые знаком тире, при этом если процесс занимает более 100Mb – 
#выводить информацию красным цветом, иначе зелёным.
Param (
    $Name = 'Name',
    $VM = 'VM'
)
Get-Process | Select-Object $Name, $VM | ForEach-Object {
if ($_.$VM -gt  100000000) {
    Write-Host -ForegroundColor Red $_.$Name $_.$VM -Separator " - "
    }
else {
    Write-Host -ForegroundColor Green $_.$Name $_.$VM -Separator " - "
    }
}

#8.	Подсчитать размер занимаемый файлами в папке C:\windows (и во всех подпапках) за исключением файлов *.tmp

$FolderSize = Get-ChildItem C:\Windows\* -Recurse -Exclude *.tmp | measure -Property length -Sum
"{0:N2}" -f $($FolderSize.Sum / 1Gb) +"Gb"

#9.	Сохранить в CSV-файле информацию о записях одной ветви реестра HKLM:\SOFTWARE\Microsoft.
Param (
    $ExFile = 'M2T2:\HKLM.csv'
)
Get-Item -Path HKLM:\SOFTWARE\Microsoft | Export-Csv $ExFile

#10. Сохранить в XML -файле историческую информацию о командах выполнявшихся в текущем сеансе работы PS.
Param (
    $ExpFile = 'M2T2:\History.xml'
)
Get-History | Format-List * | Export-Clixml -Path $ExpFile

#11. Загрузить данные из полученного в п.10 xml-файла и вывести в виде списка информацию о каждой записи, в виде 5 любых (выбранных Вами) свойств.
Param (
    $ExportFile = 'M2T2:\History.xml',
    $Prop = 'ID'
)
Get-ChildItem $ExportFile | Import-Clixml | Format-List -Property $Prop, CommandLine, ExecutionStatus, StartExecutionTime, EndExecutionTime

#12. Удалить созданный диск и папку С:\M2T2_ФАМИЛИЯ
Param (
    $Disk = 'M2T2'
)
Remove-PSDrive -Name $Disk

Remove-Item -Path C:\M2T2_KALLAUR -Recurse

# 1.1. Сохранить в текстовый файл на диске список запущенных(!) служб. Просмотреть содержимое диска. Вывести содержимое файла в консоль PS.
Get-Service | Where-Object {$_.Status -eq "Running"} | Out-File -FilePath C:\M2T2_KALLAUR\Services.txt

Get-Content -Path C:\M2T2_KALLAUR\Services.txt

#1.2 Просуммировать все числовые значения переменных среды Windows. (Параметры не нужны) Переменные среды. Получить их через PS
$allenvvariables = Get-ChildItem Env:
foreach ($envvariable in $allenvvariables) {
    Write-Output "Value = $($envvariable.value)"
    try {
        $tempvariable = [int]($envvariable.value)
        Write-Output "Yehhhhoooo"
    }
    catch {
        $i++
    }
}
Write-Output "Count of catch variables = $i"


#1.3. Вывести список из 10 процессов занимающих дольше всего процессор. Результат записывать в файл.
Get-Process | Sort-Object CPU -Descending | Select Handles, CPU, Id, SI, ProcessName -First 10 | Out-File -FilePath C:\M2T2_KALLAUR\Processes.txt

#1.3.1.	Организовать запуск скрипта каждые 10 минут
#Создаём новый триггер $t с заданными повторяющимися временными параметрами
$t = New-JobTrigger -Once -At "16.02.2019 21:24:00"  -RepetitionInterval (New-TimeSpan -Minutes 10) -RepetitionDuration (New-Timespan -Hours 48)

#Регистрируем Задание по расписанию из скрипта с триггером $t
Register-ScheduledJob -Name script1_3_1 -FilePath d:\!Valik\Отчёты\PowerShell\_Labwork3\script1_3_1.ps1 -Trigger $t

#Остановка повторяющегося триггера
Get-JobTrigger -Name script1_3_1 | Set-JobTrigger -RepetitionInterval 0:00 -RepetitionDuration 0:00

#1.4. Подсчитать размер занимаемый файлами в папке (например C:\windows) за исключением файлов с заданным расширением(напрмер .tmp)
"{0:N2} Gb" -f ((Get-ChildItem C:\Windows\* -Recurse -Exclude *.tmp | measure Length -s).Sum / 1Gb)

<#1.5.	Создать один скрипт, объединив 3 задачи:
1.5.1.	Сохранить в CSV-файле информацию обо всех обновлениях безопасности ОС.
1.5.2.	Сохранить в XML-файле информацию о записях одной ветви реестра HKLM:\SOFTWARE\Microsoft.
1.5.3.	Загрузить данные из полученного в п.1.5.1 или п.1.5.2 файла и вывести в виде списка разными цветами
#>


d:\!Valik\Отчёты\PowerShell\_Labwork3\script1_5.ps1
 
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






