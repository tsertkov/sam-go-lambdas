# sam-go-lambdas

Serverless playground with AWS SAM.

## Features played

- Build lambdas inside docker containers

  `make ci-build` -> `sam build --use-container`
    
- Build Go lambdas using Makefile
- Build Python lambda layer using Makefile
- Build Python lambda layer with AWS SAM PythonPipBuilder
- Build Nodejs lambda layer with AWS SAM NodejsNpmBuilder
- ApiGateway lambda proxy integration
- Go API lambdas with Gin and Echo frameworks
- Inline Python lambda using shared layers (no tests)
- Inline Nodejs lambda using shared layers (no tests)
- ResourceGroup for grouping application resources

## Usage

Start with generating SAM configuration file by invoking `sam deploy --guided`.

Cli commands:

- `make build` - test and build lambda functions and layers
- `sam deploy` - deploy application
- `sam local start-api` - launch api locally
- `sam logs` - remote logs monitoring
- `sam delete` - delete provisioned infra

Scripts:

- `scripts/call-api-gw.sh` - invoke deployed lambdas with aws api gateway
- `scripts/invoke-lambdas.sh` - invoke deployed lambdas with aws cli
