#1. ����������� ���������� ����� ��e���� HKCU.
#script1.ps1
Param
(
   $File='D:\!Valik\!Temp\Task1.txt'

)
cd HKCU:\
dir | Out-File $File