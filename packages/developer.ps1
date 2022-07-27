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
