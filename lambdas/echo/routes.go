package main

import (
  "net/http"

  echo "github.com/labstack/echo/v4"
)

func initRoutes(e *echo.Echo, prefix string) {
  g := e.Group(prefix)
  g.GET("/status", statusHandler)
}

func statusHandler(c echo.Context) error {
  return c.String(http.StatusOK, "OK")
}
