package handler

import (
	"fmt"

	"github.com/douglastofoli/devlog/web/templates"
	"github.com/gin-contrib/gzip"
	"github.com/gin-gonic/gin"
)

type Config struct {
	Router *gin.Engine
}

type GinRouter struct {
	Engine *gin.Engine
}

func NewRouter() *GinRouter {
	r := &GinRouter{
		Engine: gin.Default(),
	}
	r.Engine.Use(gzip.Gzip(gzip.DefaultCompression))
	r.Routes()

	return r
}

func (gr GinRouter) Routes() {
	r := gr.Engine
	r.GET("/", gr.Index)
}

func (gr GinRouter) Index(c *gin.Context) {
	c.Status(200)
	c.Header("Content-Type", "text/html; charset=utf-8")
	templates.Base().Render(c.Request.Context(), c.Writer)
}
