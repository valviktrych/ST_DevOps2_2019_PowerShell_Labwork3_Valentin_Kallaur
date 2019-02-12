# 2.1 Создание каталога на локальном диске.
Param
(
   $File='D:\!Valik\!Temp\Task2_1.txt'

)
New-Item -Path 'D:\!Valik\!Temp\!Folder' -ItemType "directory" | Out-File $File