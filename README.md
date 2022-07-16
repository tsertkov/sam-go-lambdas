# sam-go-lambdas

Serverless playgroup with AWS SAM.

## Features played

- Building Go lambdas using Makefile
- Building Python lambda layer using Makefine
- Building Python lambda layer with PythonPipBuilder
- Building Nodejs lambda layer with NodejsNpmBuilder
- ApiGateway lambda proxy integration
- Go API lambdas with Gin and Echo frameworks
- Inline Python lambda using shared layers
- Inline Nodejs lambda using shared layers
- ResourceGroup for grouping application resources

## Usage

Start with generating SAM configuration file by invoking `sam deploy --guided`

Cli commands:

- `make build` - test and build lambda functions and layers
- `sam deploy` - deploy application
- `sam local start-api` - launch api locally
- `sam logs` - remote logs monitoring

Test scripts:

- `scripts/call-api-gw.sh` - calls deployed api gateway endpoints
- `scripts/invoke-lambdas.sh` - invokes deployed lambdas with aws cli
