# �� ���� ������� Labwork2
# 1.	�������� �������� *.ps1 ��� ����� �� labwork 2, ��������� �� ������������������. ������ �������� ������ ����� ���������.

# 1. ����������� ���������� ����� ��e���� HKCU.
# script1.ps1 
Param
(
   $File = 'D:\!Valik\!Temp\Task1.txt'

)
cd HKCU:\
dir | Out-File $File 

# ������� � ���������� ����� �������, �������� HKCU\Software\Microsoft\Windows\CurrentVersion\
# script1_1.ps1
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















# 1.1. ��������� � ��������� ���� �� ����� ������ ����������(!) �����. ����������� ���������� �����. ������� ���������� ����� � ������� PS.
$a = 0 
foreach ($b in $a) {
    Get-Service if ($b -eq "Running") {Write-Host $b}
}

 
# 2.	������ � ��������
# 2.1.	������� �������

 New-Item -ItemType file -Path $PROFILE -force

 # ��������� ������ PowerShell
  <#PS C:\Users\Administrator> Test-Path $PROFILE
False
PS C:\Users\Administrator> New-Item -ItemType file -Path $PROFILE -force


    Directory: C:\Users\Administrator\Documents\WindowsPowerShell


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a----         13.02.19     14:26              0 Microsoft.PowerShell_profile.ps1
 #>

# ��������� ������ � PowerShellISE
 <#PS C:\Users\Administrator> New-Item -ItemType file -Path $PROFILE -force


    Directory: C:\Users\Administrator\Documents\WindowsPowerShell


Mode                LastWriteTime         Length Name                                                                                                                                         
----                -------------         ------ ----                                                                                                                                         
-a----         13.02.19     14:27              0 Microsoft.PowerShellISE_profile.ps1 
 #>

# 2.2. � ������� �������� ����� � ������� PowerShell

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

# 2.3. ������� ��������� ����������� ������� � ����� Microsoft.PowerShell_profile.ps1 ���������� ��������� �������
<#Set-Alias HelpMe Get-Help
Set-Alias Gt_Memb Get-Member
Set-Alias Gt_Proc Get-Process
#>
Get-Process

HelpMe

# 2.4. ������� ��������� ��������
#���������� � ���� .ps1 ������� ��������� ������

<#Set-Variable Ro -option Constant -Value 7.25
Set-Variable pi -option Constant -Value 3.14
Set-Variable Ad -option Constant -Value 10
#>

$ad


# 2.5. �������� ������� �����

# ���������� � ���� .ps1 ������� ��������� ������

<#Set-Location C:\#> 

# ���������� ������� �� ��������� ����� ��������� ������ PS C:\>

#2.6. ������� ����������

# ���������� � ���� .ps1 ������� ��������� ������

# Write-Host "Hello, Valentin!!!!"

# �����
<# Hello, Valentin!!!!
PS C:\>
#>

# 3. �������� ������ ���� ��������� �������
# ��������� ������ �������, ������������� � �������������� �� ���������
Get-Module -ListAvailable
# ������, ��������������� � ����� PowerShell
Get-Module






