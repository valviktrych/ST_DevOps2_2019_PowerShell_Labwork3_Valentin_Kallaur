# �� ���� ������� Labwork2
#1.	�������� �������� *.ps1 ��� ����� �� labwork 2, ��������� �� ������������������. ������ �������� ������ ����� ���������.

#1. ����������� ���������� ����� ��e���� HKCU.
#script1.ps1 
Param
(
   $File = 'D:\!Valik\!Temp\Task1.txt'

)
cd HKCU:\
dir | Out-File $File 

# ������� � ���������� ����� �������, �������� HKCU\Software\Microsoft\Windows\CurrentVersion\
#script1_1.ps1
Param
(
   $File = 'D:\!Valik\!Temp\Task1_1.txt'

)
Set-Location -Path HKCU:\Software\Microsoft\Windows\CurrentVersion
dir | Out-File $File

# ����� ����������� \Software\Microsoft\Windows\CurrentVersion\Run
Param
(
   $File = 'D:\!Valik\!Temp\Task1_2.txt'

)
Get-Item -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run | Out-File $File

#2.	�������, �������������, ������� ������� �� ��������� �����

# 2.1 �������� �������� �� ��������� �����.
Param
(
   $File = 'D:\!Valik\!Temp\Task2_1.txt' 
   #$Folder = 'D:\!Valik\!Temp\!Folder'
)
New-Item -Path 'D:\!Valik\!Temp\!Folder' -ItemType "directory" | Out-File $File

# 2.2 �������������� �������� �� ������ �����.
cd D:\!Valik\!Temp\!Folder

# �������� ������� Test
New-Item -Path 'D:\!Valik\!Temp\!Folder\Test' -ItemType "directory"

# �������������� Test
Param
(
   $File = 'D:\!Valik\!Temp\Task2_2.txt' 
)
Rename-Item -Path 'D:\!Valik\!Temp\!Folder\Test'-NewName Test_1
dir | Out-File $File

# 2.3 �������� �������� Test_1
cd D:\!Valik\!Temp\

Param
(
   $File = 'D:\!Valik\!Temp\Task2_3.txt' 
)
Remove-Item D:\!Valik\!Temp\!Folder\Test_1
dir | Out-File $File













#1.1. ��������� � ��������� ���� �� ����� ������ ����������(!) �����. ����������� ���������� �����. ������� ���������� ����� � ������� PS.
