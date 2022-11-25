# FROM mcr.microsoft.com/windows:latest
FROM mcr.microsoft.com/windows:1809-amd64
# FROM golang:1.19.3-windowsservercore-1809
WORKDIR /
COPY ./setup C:/setup
RUN powershell -ExecutionPolicy Bypass -File "C:\setup\setup.ps1" && \
    powershell "Remove-Item -Path 'C:\setup' -Recurse -Force"
