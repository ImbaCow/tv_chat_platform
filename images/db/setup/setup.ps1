function Install-VCRedist {
    Write-Output "Begin VC Redist installation"
    $ReleaseUrl = 'https://aka.ms/vs/16/release/vc_redist.x64.exe'
    Invoke-RestMethod $ReleaseUrl -OutFile "$env:temp\vc_redist.x64.exe"
    & "$env:temp\vc_redist.x64.exe" /install /passive /norestart
    Write-Output "Complete VC Redist installation"
}

function Install-Winget {
    Write-Output "Begin WinGet installation"
    $ReleaseUrl = 'https://api.github.com/repos/microsoft/winget-cli/releases/latest'
    $Response = Invoke-RestMethod $ReleaseUrl
    $PackageData = $Response[0].assets | Where-Object name -Match 'msixbundle'
    Invoke-RestMethod $PackageData.browser_download_url -OutFile "$env:temp\DesktopAppInstaller.zip"
    Expand-Archive -Path "$env:temp\DesktopAppInstaller.zip" -DestinationPath "$env:temp\DesktopAppInstaller" -Force
    Move-Item "$env:temp\DesktopAppInstaller\AppInstaller_x64.msix" "$env:temp\AppInstaller_x64.zip" -Force
    Expand-Archive -Path "$env:temp\AppInstaller_x64.zip" -DestinationPath "C:\Program Files\winget-cli" -Force
    Write-Output "Complete WinGet installation"
}

function Winget-Install {
    param($ID)
    & "C:\Program Files\winget-cli\winget.exe" install $ID -h --accept-package-agreements --accept-source-agreements
}

function Install-Mysql {
    Winget-Install "Oracle.MySQL"
}

$ProgressPreference = 'SilentlyContinue'
Install-VCRedist
Install-Winget
Install-Mysql