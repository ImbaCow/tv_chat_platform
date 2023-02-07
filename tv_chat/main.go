package main

import "github.com/ImbaCow/tv_chat/src/common/server"

func main() {
	appContainer := app.NewAppContainer()
	server := server.NewRestServer(appContainer)
}
