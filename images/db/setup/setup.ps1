function Winget-Install {
    param($ID)
    # Write-Output $ID"args"$args
    & 'C:\Program Files\winget-cli\winget.exe' install $ID -h --accept-package-agreements --accept-source-agreements $args
    # & "C:\Program Files\winget-cli\winget.exe" uninstall $ID -h
}

function Install-Mysql {
    Write-Output "Begin MySQL installation"
    # Install-PackageProvider -Name NuGet -Force
    # Install-Module MariaDBCmdlets -Force
    Winget-Install "MariaDB.Server"
    $DbDir = 'C:\Program Files\' + (Get-ChildItem -Path 'C:\Program Files\' -Filter mariadb*)[0].Name
    # $NewDbDir = 'C:\Program Files\MySQL'
    # New-Item -Path $NewDbDir -ItemType SymbolicLink -Value $DbDir
    # Move-Item $DbDir $NewDbDir -Force
    # & "$DbDir\bin\mysqld.exe" --console --explicit_defaults_for_timestamp
    & "$DbDir\bin\mysqld.exe" --install
    [Environment]::SetEnvironmentVariable("Path", $env:Path + ";$DbDir\bin", "Machine")
    Write-Output "Complete MySQL installation"
}

function Start-Mysql {
    Start-Service MySQL
}

Install-Mysql
Start-Mysql