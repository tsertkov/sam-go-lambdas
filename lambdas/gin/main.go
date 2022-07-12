package main

import (
  "context"

  "github.com/aws/aws-lambda-go/events"
  "github.com/aws/aws-lambda-go/lambda"
  ginAdapter "github.com/awslabs/aws-lambda-go-api-proxy/gin"
  "github.com/gin-gonic/gin"
)

var ginLambda *ginAdapter.GinLambda

func init() {
  r := gin.New()
  r.Use(gin.Recovery())
  initRoutes(r, "/gin")
  ginLambda = ginAdapter.New(r)
}

func Handler(ctx context.Context, req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
  return ginLambda.ProxyWithContext(ctx, req)
}

func main() {
  lambda.Start(Handler)
}
