# 2.3 Удаление каталога Test_1
cd D:\!Valik\!Temp\

Param
(
   $File = 'D:\!Valik\!Temp\Task2_3.txt' 
)
Remove-Item D:\!Valik\!Temp\!Folder\Test_1
dir | Out-File $File