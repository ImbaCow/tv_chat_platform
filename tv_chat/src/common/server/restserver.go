package server

import (
	"github.com/gorilla/mux"
)

type restServer struct {
	router *mux.Router
}

func NewRestServer(f controllerFactory) *restServer {
	s := &restServer{}

	s.configureRouter(f)
	return s
}

func (s *restServer) configureRouter(f controllerFactory) {
	s.configureTempRouter(f.getTempController())
}

func (s *restServer) configureTempRouter(c ITempController) {
	s.router.HandleFunc("/hello", c.HandleHello())
}
