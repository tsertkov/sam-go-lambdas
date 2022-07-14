# sam-go-lambdas

Serverless playgroup with AWS SAM.

## Features played

- Building lambdas using Makefile
- Building Python lambda layer with PythonPipBuilder
- Building Nodejs lambda layer with NodejsNpmBuilder
- ApiGateway lambda proxy integration
- Go compiled lambdas
- Python lambda with inline code and shared layer
- Nodejs lambda with inline code and shared layer
- ResourceGroup for grouping application resources

## Usage

Start with generating SAM configuration file by invoking `sam deploy --guided`

SAM cli commands:

- `sam build` - build all lambda functions and layers
- `sam deploy` - deploy application
- `sam local start-api` - launch api locally
- `sam logs` - remote logs monitoring

Make tasks:

- `make build` - test and build lambdas & layers
- `make test` - test lambdas & layers

Test scripts:

- `scripts/call-api-gw.sh` - calling api gateway endpoints to trigger lambdas
- `scripts/invoke-lambdas.sh` - aws cli lambdas invocations
