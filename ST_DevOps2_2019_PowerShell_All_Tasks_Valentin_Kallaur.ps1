# По всем пунктам Labwork2
#1.	Создайте сценарии *.ps1 для задач из labwork 2, проверьте их работоспостобность. Каждый сценарий должен иметь параметры.

#1. Просмотреть содержимое ветви реeстра HKCU.
#script1.ps1 
Param
(
   $File = 'D:\!Valik\!Temp\Task1.txt'

)
cd HKCU:\
dir | Out-File $File 

# Переход к конкретной ветви реестра, например HKCU\Software\Microsoft\Windows\CurrentVersion\
#script1_1.ps1
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













#1.1. Сохранить в текстовый файл на диске список запущенных(!) служб. Просмотреть содержимое диска. Вывести содержимое файла в консоль PS.
