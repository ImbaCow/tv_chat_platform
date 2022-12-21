#!/bin/sh

go mod download
go mod verify
go get
go build -o /usr/app/bin ./...
/usr/app/bin
