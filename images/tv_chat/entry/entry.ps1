# function Install-VCRedist {
#     Write-Output "Begin VC Redist installation"
#     $ReleaseUrl = 'https://aka.ms/vs/16/release/vc_redist.x64.exe'
#     Invoke-RestMethod $ReleaseUrl -OutFile "$env:temp\vc_redist.x64.exe"
#     & "$env:temp\vc_redist.x64.exe" /install /passive /norestart
#     Write-Output "Complete VC Redist installation"
# }

# function Install-Winget {
#     Write-Output "Begin WinGet installation"
#     $ReleaseUrl = 'https://api.github.com/repos/microsoft/winget-cli/releases/latest'
#     $Response = Invoke-RestMethod $ReleaseUrl
#     $PackageData = $Response[0].assets | Where-Object name -Match 'msixbundle'
#     Invoke-RestMethod $PackageData.browser_download_url -OutFile "$env:temp\DesktopAppInstaller.zip"
#     Expand-Archive -Path "$env:temp\DesktopAppInstaller.zip" -DestinationPath "$env:temp\DesktopAppInstaller" -Force
#     Move-Item "$env:temp\DesktopAppInstaller\AppInstaller_x64.msix" "$env:temp\AppInstaller_x64.zip" -Force
#     Expand-Archive -Path "$env:temp\AppInstaller_x64.zip" -DestinationPath "C:\Program Files\winget-cli" -Force
#     Write-Output "Complete WinGet installation"
# }

# function Winget-Install {
#     param($ID)
#     & "C:\Program Files\winget-cli\winget.exe" install $ID -h --accept-package-agreements --accept-source-agreements
# }

# function Invoke-MsysCommand {
#     param($Command)
#     & "C:\msys64\usr\bin\bash.exe" -l -c $Command
# }

# function Install-Clang {
#     Write-Output "Begin Clang installation"
#     Winget-Install msys2.msys2
#     Invoke-MsysCommand "pacman - -needed --noconfirm -Sy bash pacman pacman-mirrors msys2-runtime mingw-w64-x86_64-clang mingw-w64-i686-clang"
#     Invoke-MsysCommand "pacman --noconfirm -Su"
#     [Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\msys64\mingw64\bin", "User")
#     Write-Output "Complete Clang installation"
# }

# function Install-DotNet {
#     Winget-Install Microsoft.DotNet.SDK.6
#     Winget-Install Microsoft.DotNet.DesktopRuntime.6
#     Winget-Install Microsoft.DotNet.AspNetCore.6
# }

function Start-Server {
    go mod download
    go build -o C:/bin/app.exe main.go
    & "C:\bin\app.exe"
}

Start-Server