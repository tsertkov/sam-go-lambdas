build_cmd=CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -tags nomsgpack -o ${ARTIFACTS_DIR}/main .
build-GinFunction :
	cd lambdas/gin && $(build_cmd)
build-EchoFunction :
	cd lambdas/echo && $(build_cmd)
test : test-NodejsCommonLayer test-PythonCommonLayer
test-NodejsCommonLayer :
	cd layers/nodejs-common && npm test
test-PythonCommonLayer :
	cd layers/python-common && pip3 check && python3 test.py
