build_cmd=CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -tags nomsgpack -o ${ARTIFACTS_DIR}/main .
build : test-layers
	sam build --parallel
ci-build : test-layers
	sam build use-container --parallel
build-GinFunction : test-GinFunction
	cd lambdas/gin && $(build_cmd)
build-EchoFunction : test-EchoFunction
	cd lambdas/echo && $(build_cmd)
build-PythonCommonLayerB : test-PythonCommonLayerB
	mkdir -p ${ARTIFACTS_DIR}/python
	python3 -m pip install -r layers/python-common-b/requirements.txt -t ${ARTIFACTS_DIR}/python
	cp -r layers/python-common-b/* ${ARTIFACTS_DIR}/python
	rm -rf ${ARTIFACTS_DIR}/python/bin
test-layers : test-NodejsCommonLayer test-PythonCommonLayerA
test-GinFunction :
	cd lambdas/gin && go test
test-EchoFunction :
	cd lambdas/echo && go test
test-NodejsCommonLayer :
	cd layers/nodejs-common && npm i && npm test
test-PythonCommonLayerA :
	cd layers/python-common-a && python3 test.py
test-PythonCommonLayerB :
	cd layers/python-common-b && python3 test.py
