param ($userName, $userEmail, $sshPass)

#Requires -RunAsAdministrator

$PathSSD="E:\Programas Windows"
$PathHD="D:\Programas Windows"
$UUID="25e8d8a0-e95c-4e0f-8976-fb09ec674099"

Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all

.\packages\remove.ps1
.\packages\developer.ps1
.\packages\gamer.ps1
.\packages\general.ps1

