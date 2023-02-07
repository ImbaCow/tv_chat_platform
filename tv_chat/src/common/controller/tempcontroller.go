package controller

import (
	"io"
	"net/http"
)

type tempController struct {
}

func NewTempController() *tempController {
	c := &tempController{}
	return c
}

func (c *tempController) HandleHello() http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		io.WriteString(w, "Hello")
	}
}
