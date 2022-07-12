build_cmd=CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -tags nomsgpack -o ${ARTIFACTS_DIR}/main .
init :
	sam deploy --guided
build :
	sam build
build-GinFunction :
	cd lambdas/gin && $(build_cmd)
build-EchoFunction :
	cd lambdas/echo && $(build_cmd)
deploy :
	sam deploy
