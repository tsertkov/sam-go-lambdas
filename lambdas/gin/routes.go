package main

import (
  "net/http"

  "github.com/gin-gonic/gin"
)

func initRoutes(e *gin.Engine, prefix string) {
  g := e.Group(prefix)
  g.GET("/status", statusHandler)
}

func statusHandler(c *gin.Context) {
  c.String(http.StatusOK, "OK")
}
