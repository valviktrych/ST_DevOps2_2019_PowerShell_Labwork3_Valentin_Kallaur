# �� ���� ������� Labwork2
# 1.	�������� �������� *.ps1 ��� ����� �� labwork 2, ��������� �� ������������������. ������ �������� ������ ����� ���������.

# 1. ����������� ���������� ����� ��e���� HKCU.
# script1.ps1 
Param (
   $File = 'D:\!Valik\!Temp\Task1.txt'

)
cd HKCU:\
dir | Out-File $File 

# ������� � ���������� ����� �������, �������� HKCU\Software\Microsoft\Windows\CurrentVersion\
# script1_1.ps1
Param (
   $File = 'D:\!Valik\!Temp\Task1_1.txt'

)
Set-Location -Path HKCU:\Software\Microsoft\Windows\CurrentVersion
dir | Out-File $File

# ����� ����������� \Software\Microsoft\Windows\CurrentVersion\Run
Param (
   $File = 'D:\!Valik\!Temp\Task1_2.txt'

)
Get-Item -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run | Out-File $File

#2.	�������, �������������, ������� ������� �� ��������� �����

# 2.1 �������� �������� �� ��������� �����.
Param (
   $File = 'D:\!Valik\!Temp\Task2_1.txt' 
   #$Folder = 'D:\!Valik\!Temp\!Folder'
)
New-Item -Path 'D:\!Valik\!Temp\!Folder' -ItemType "directory" | Out-File $File

# 2.2 �������������� �������� �� ������ �����.
cd D:\!Valik\!Temp\!Folder

# �������� ������� Test
New-Item -Path 'D:\!Valik\!Temp\!Folder\Test' -ItemType "directory"

# �������������� Test
Param (
   $File = 'D:\!Valik\!Temp\Task2_2.txt' 
)
Rename-Item -Path 'D:\!Valik\!Temp\!Folder\Test'-NewName Test_1
dir | Out-File $File

# 2.3 �������� �������� Test_1
cd D:\!Valik\!Temp\

Param (
   $File = 'D:\!Valik\!Temp\Task2_3.txt' 
)
Remove-Item D:\!Valik\!Temp\!Folder\Test_1
dir | Out-File $File

# 3. ������� ����� C:\M2T2_�������. ������� ���� ��������������� � ������ C:\M2T2_�������.
# 3.1 �������� ����� C:\M2T2_KALLAUR
Param (
        [string]$Path = 'C:\M2T2_KALLAUR'
)
New-Item -Path $Path -ItemType "directory"

# 3.2 �������� �����, ���������������� � ������ C:\M2T2_KALLAUR
Param (
    [string]$DriveName = 'M2T2'
)
New-PSDrive -Name $DriveName -PSProvider FileSystem -Root "C:\M2T2_KALLAUR" -Description "Maps to M2T2"


# 3.2.1 �������� ����������
Param (
    [string]$DriveName = 'M2T2'
)
Get-PSDrive -Name $DriveName

#4.	��������� � ��������� ���� �� ��������� ����� ������ ����������(!) �����. ����������� ���������� �����. ������� ���������� ����� � ������� PS.

#4.1 ��������� � ��������� ���� Services.txt ������ ���������� ����� �� ��������� ����� M2T2.
Param (
    [string]$File = 'M2T2:\Services.txt'
    )
Get-Service | Where-Object {$_.Status -eq "Running"} | Out-File -FilePath $File

#4.2 ����������� ���������� �����.

dir M2T2:

#4.3 ������� ���������� ����� � ������� PS.
Param (
    $File = 'Services.txt'
)
Get-Content M2T2:\$File

#5.	�������������� ��� �������� �������� ���������� �������� ������.
Param (
    #[parameter(Mandatory=$true,ValueFromPipeline=$true)]
    $Column = 'Value'
)
$sum = 0
foreach ($_ in $V = Get-Variable | Select-Object $Column | Where-Object {$_.Value -is [int]} ) {
    
    $sum += $_.Value
    
}
Write-Host("Total sum: $sum")

#6.	������� ������ �� 6 ��������� ���������� ������ ����� ���������.
Param (
    $Column1 = 'CPU',
    $Column2 = 'ProcessName'
)
Get-Process | Select-Object $Column1, $Column2 | Sort-Object $Column1 -Descending | Select-Object $Column1 -first 6

#7.	������� ������ �������� � ������� ����������� ������ (� Mb) ������� ��������, ���������� ������ ����, ��� ���� ���� ������� �������� ����� 100Mb � 
#�������� ���������� ������� ������, ����� ������.
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

#8.	���������� ������ ���������� ������� � ����� C:\windows (� �� ���� ���������) �� ����������� ������ *.tmp

$FolderSize = Get-ChildItem C:\Windows\* -Recurse -Exclude *.tmp | measure -Property length -Sum
"{0:N2}" -f $($FolderSize.Sum / 1Gb) +"Gb"

#9.	��������� � CSV-����� ���������� � ������� ����� ����� ������� HKLM:\SOFTWARE\Microsoft.
Param (
    $ExFile = 'M2T2:\HKLM.csv'
)
Get-Item -Path HKLM:\SOFTWARE\Microsoft | Export-Csv $ExFile

#10. ��������� � XML -����� ������������ ���������� � �������� ������������� � ������� ������ ������ PS.
Param (
    $ExpFile = 'M2T2:\History.xml'
)
Get-History | Format-List * | Export-Clixml -Path $ExpFile

#11. ��������� ������ �� ����������� � �.10 xml-����� � ������� � ���� ������ ���������� � ������ ������, � ���� 5 ����� (��������� ����) �������.
Param (
    $ExportFile = 'M2T2:\History.xml',
    $Prop = 'ID'
)
Get-ChildItem $ExportFile | Import-Clixml | Format-List -Property $Prop, CommandLine, ExecutionStatus, StartExecutionTime, EndExecutionTime

#12. ������� ��������� ���� � ����� �:\M2T2_�������
Param (
    $Disk = 'M2T2'
)
Remove-PSDrive -Name $Disk

Remove-Item -Path C:\M2T2_KALLAUR -Recurse

# 1.1. ��������� � ��������� ���� �� ����� ������ ����������(!) �����. ����������� ���������� �����. ������� ���������� ����� � ������� PS.
Get-Service | Where-Object {$_.Status -eq "Running"} | Out-File -FilePath C:\M2T2_KALLAUR\Services.txt

Get-Content -Path C:\M2T2_KALLAUR\Services.txt

#1.2 �������������� ��� �������� �������� ���������� ����� Windows. (��������� �� �����) ���������� �����. �������� �� ����� PS
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


#1.3. ������� ������ �� 10 ��������� ���������� ������ ����� ���������. ��������� ���������� � ����.
Get-Process | Sort-Object CPU -Descending | Select Handles, CPU, Id, SI, ProcessName -First 10 | Out-File -FilePath C:\M2T2_KALLAUR\Processes.txt

#1.3.1.	������������ ������ ������� ������ 10 �����
#������ ����� ������� $t � ��������� �������������� ���������� �����������
$t = New-JobTrigger -Once -At "16.02.2019 21:24:00"  -RepetitionInterval (New-TimeSpan -Minutes 10) -RepetitionDuration (New-Timespan -Hours 48)

#������������ ������� �� ���������� �� ������� � ��������� $t
Register-ScheduledJob -Name script1_3_1 -FilePath d:\!Valik\������\PowerShell\_Labwork3\script1_3_1.ps1 -Trigger $t

#��������� �������������� ��������
Get-JobTrigger -Name script1_3_1 | Set-JobTrigger -RepetitionInterval 0:00 -RepetitionDuration 0:00

#1.4. ���������� ������ ���������� ������� � ����� (�������� C:\windows) �� ����������� ������ � �������� �����������(������� .tmp)
"{0:N2} Gb" -f ((Get-ChildItem C:\Windows\* -Recurse -Exclude *.tmp | measure Length -s).Sum / 1Gb)

<#1.5.	������� ���� ������, ��������� 3 ������:
1.5.1.	��������� � CSV-����� ���������� ��� ���� ����������� ������������ ��.
1.5.2.	��������� � XML-����� ���������� � ������� ����� ����� ������� HKLM:\SOFTWARE\Microsoft.
1.5.3.	��������� ������ �� ����������� � �.1.5.1 ��� �.1.5.2 ����� � ������� � ���� ������ ������� �������
#>


d:\!Valik\������\PowerShell\_Labwork3\script1_5.ps1
 
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






