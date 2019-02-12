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