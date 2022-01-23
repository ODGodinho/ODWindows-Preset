param ($userName, $userEmail, $sshPass)

Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -norestart
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all

$PathSSD="E:\Programas Windows"
$PathHD="D:\Programas Windows"

# Remove One Drive
winget uninstall -e --id Microsoft.OneDrive

## DEVELOPER

# Git bash install
 winget install --location=`"$($PathHD)\Git`" -e --id="Git.Git"

# Node 14 install
winget install  --location=`"$($PathSSD)\NodeJs`" -e --id OpenJS.NodeJS.LTS

# Yarn
winget install  --location=`"$($PathSSD)\Yarn`" -e --id Yarn.Yarn

# Docker install
winget install --location=`"$($PathSSD)\Docker`"  -e --id Docker.DockerDesktop

# Vscode
winget install --location=`"$($PathSSD)\VsCode`" -e --id Microsoft.VisualStudioCode


## GAMES

# Steam Install
winget install --location=`"$($PathSSD)\Steam`" -e --id Valve.Steam

# Epic Games
winget install --location=`"$($PathHD)\EpicGames`" -e --id EpicGames.EpicGamesLauncher

# GeForceExperience
winget install  --location=`"$($PathSSD)\GeForceExperience`" -e --id Nvidia.GeForceExperience

# Obs Studio install
winget install --location=`"$($PathHD)\ObsStudio`" -e --id OBSProject.OBSStudio

# Icue
winget install --location=`"$($PathHD)\ICue`" -e --id Corsair.iCUE.4

# Origin Play / Ea Play
winget install --location=`"$($PathHD)\OriginPlay`" -e --id ElectronicArts.EADesktop

# Visual c++ 2015 a 2022
winget install -e --id Microsoft.VC++2015-2022Redist-x64

# Ubuntu terminal
winget install --location=`"$($PathHD)\Ubuntu`" -e --id Canonical.Ubuntu.2004


# General

# Install Discord
winget install --location=`"$($PathSSD)\Discord`"  -e --id Discord.Discord

# Install Whastapp Web Beta
winget install --location=`"$($PathHD)\WhastappWebBeta`" -e --id WhatsApp.WhatsApp.Beta


if ($null -eq $userName) {
$userName = read-host -Prompt "Github username"
}

if ($null -eq $userEmail) {
$userEmail = read-host -Prompt "Github email"
}

if ($null -eq $sshPass) {
$sshPass = read-host -Prompt "You ssh password"
}

# github config user name
git config --global user.name "$userName"
git config --global user.email "$userEmail"
git config --global color.ui true

# geenerate SSH key
ssh-keygen -t ed25519 -N "$sshPass" -C "$userEmail" -f $env:USERPROFILE\.ssh\id_rsa

# Load ssh key
ssh-agent -s
Get-Service -Name ssh-agent | Set-Service -StartupType Automatic
Start-Service ssh-agent
ssh-add $env:USERPROFILE\.ssh\id_rsa

