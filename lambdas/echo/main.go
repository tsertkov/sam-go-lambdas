package main

import (
  "context"

  "github.com/aws/aws-lambda-go/events"
  "github.com/aws/aws-lambda-go/lambda"
  echoAdapter "github.com/awslabs/aws-lambda-go-api-proxy/echo"
  echo "github.com/labstack/echo/v4"
  "github.com/labstack/echo/v4/middleware"
)

var echoLambda *echoAdapter.EchoLambda

func init() {
  e := echo.New()
  e.Use(middleware.Recover())
  initRoutes(e, "/echo")
  echoLambda = echoAdapter.New(e)
}

func Handler(ctx context.Context, req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
  return echoLambda.ProxyWithContext(ctx, req)
}

func main() {
  lambda.Start(Handler)
}
