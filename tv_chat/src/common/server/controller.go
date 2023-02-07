package server

import (
	"net/http"
)

type IControllerFactory interface {
	GetTempController() ITempController
}

type ITempController interface {
	HandleHello() http.HandlerFunc
}
