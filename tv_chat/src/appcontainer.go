package app

import (
	"github.com/ImbaCow/tv_chat/src/common/controller"
	"github.com/ImbaCow/tv_chat/src/common/server"
)

type appContainer struct {
	tempController server.ITempController
}

func NewAppContainer() *appContainer {
	c := &appContainer{}
	return c
}

func (c *appContainer) GetControllerFactory() server.IControllerFactory {

}

func (c *appContainer) GetTempController() server.ITempController {
	if c.tempController == nil {
		c.tempController = controller.NewTempController()
	}
	return c.tempController
}
