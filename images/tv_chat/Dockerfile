# FROM mcr.microsoft.com/windows/servercore:ltsc2022
# FROM mcr.microsoft.com/windows/server:ltsc2022
# FROM mcr.microsoft.com/windows:ltsc2019
FROM golang:1.19
# FROM mcr.microsoft.com/windows/nanoserver:ltsc2022
# FROM mcr.microsoft.com/dotnet/sdk:6.0
WORKDIR /usr/app/src
COPY ./setup /usr/app/setup
ENTRYPOINT ["/usr/app/setup/setup.sh"]
    
    # powershell "Remove-Item -Path 'C:/setup/setup.ps1' -Recurse -Force"
# RUN powershell C:/setup/setup.ps1

# WORKDIR C:/Downloads
# ADD https://aka.ms/vs/16/release/vc_redist.x64.exe C:/Downloads/vcredist_x64.exe
# RUN C:\Downloads\vcredist_x64.exe /install /passive /norestart /log out.txt
# WORKDIR C:/winget
# ADD ./winget C:/winget

# ENTRYPOINT ["winget.exe"]
# CMD ["--help"]

# ADD ["compose", "C:/compose/"]

# RUN mkdir "%DOWNLOAD_DIR%" && \
#     mkdir "%BUILD_DIR%" && \
#     mkdir "%TARGET_DIR%" && \
#     powershell -ExecutionPolicy Bypass -File "C:\app\install.ps1" && \
#     powershell "Remove-Item -Path 'C:\app' -Recurse -Force"

# WORKDIR C:\app 