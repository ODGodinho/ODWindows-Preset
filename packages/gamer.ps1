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

Write-Output [DirectPlay] - Habilitado.
DISM /online /enable-feature /featurename:DirectPlay

Write-Output [Net Framework 3] - Habilitado.
DISM /Online /enable-feature /featurename:NetFx3 /ALL
