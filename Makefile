build_cmd=CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -tags nomsgpack -o ${ARTIFACTS_DIR}/main .
build : test
	sam build --parallel
build-GinFunction :
	cd lambdas/gin && $(build_cmd)
build-EchoFunction :
	cd lambdas/echo && $(build_cmd)
test : test-NodejsCommonLayer test-PythonCommonLayer test-EchoFunction test-GinFunction
test-GinFunction :
	cd lambdas/gin && go test
test-EchoFunction :
	cd lambdas/echo && go test
test-NodejsCommonLayer :
	cd layers/nodejs-common && npm i && npm test
test-PythonCommonLayer :
	cd layers/python-common && pip3 install -r requirements.txt && python3 test.py
