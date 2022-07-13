# sam-go-lambdas

Serverless playgroup with AWS SAM.

## Features played

- Building lambdas using Makefile
- ApiGateway lambda proxy integration
- Go compiled lambdas
- Python lambda layer with pypy builder
- Nodejs lambda layer with npm builder
- Python lambda with inline code
- Nodejs lambda with inline code

## Usage

Start with generating SAM configuration file by invoking `sam deploy --guided`

SAM cli commands:

- `sam build` - build all lambda functions and layers
- `sam deploy` - deploy application
- `sam local start-api` - launch api locally

