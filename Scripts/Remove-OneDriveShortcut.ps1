#======================================================================================
#	Author: David Segura
#	Version: 18.8.30
#	https://www.osdeploy.com/
#======================================================================================
#   Set Error Preference
#======================================================================================
$ErrorActionPreference = 'SilentlyContinue'
#$VerbosePreference = 'Continue'
#======================================================================================
#   Set OSDeploy
#======================================================================================
$OSDeploy = "$env:ProgramData\OSDeploy"
$OSConfig = "$env:ProgramData\OSConfig"
$OSConfigLogs = "$OSDeploy\Logs\OSConfig"
$ScriptName = $MyInvocation.MyCommand.Name
$ScriptDirectory = Split-Path $MyInvocation.MyCommand.Path -Parent
$Host.UI.RawUI.WindowTitle = "$ScriptDirectory\$ScriptName"
#======================================================================================
#	Create the Log Directory
#======================================================================================
if (!(Test-Path $OSConfigLogs)) {New-Item -ItemType Directory -Path $OSConfigLogs}
#======================================================================================
#	Start the Transcript
#======================================================================================
$LogName = "$ScriptName-$((Get-Date).ToString('yyyy-MM-dd-HHmmss')).log"
Start-Transcript -Path (Join-Path $OSConfigLogs $LogName)
Write-Host ""
Write-Host "Starting $ScriptName from $ScriptDirectory" -ForegroundColor Yellow
#======================================================================================





#======================================================================================
#	Remove OneDrive Shortcut
#======================================================================================
if (Test-Path "C:\Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk") {
	Write-Host "Removing OneDrive Start Menu Shortcut" -ForegroundColor Green
	Remove-Item "C:\Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk" -Force -ErrorAction SilentlyContinue
}
#======================================================================================





#======================================================================================
#	Enable the following lines for testing as needed
#	Start-Process PowerShell_ISE.exe -Wait
#	Read-Host -Prompt "Press Enter to Continue"
#======================================================================================
Stop-Transcript
#======================================================================================