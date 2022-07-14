#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../" && pwd )"
stack_name="$(sed -ne 's/^stack_name = "\(.*\)"$/\1/p' "${DIR}/samconfig.toml")"
python_lambda_arn="$( \
  aws cloudformation describe-stacks \
    --stack-name "$stack_name" \
    --query 'Stacks[].Outputs[?OutputKey==`PythonFunctionArn`].OutputValue' \
    --output text
)"
nodejs_lambda_arn="$( \
  aws cloudformation describe-stacks \
    --stack-name "$stack_name" \
    --query 'Stacks[].Outputs[?OutputKey==`NodejsFunctionArn`].OutputValue' \
    --output text
)"

function invoke_lambda () {
  arn="$1"
  echo "Invoking Lambda $arn"
  code="$(
    aws lambda invoke \
      --function-name "$arn" \
      --cli-binary-format raw-in-base64-out \
      --payload "{ \"name\": \"thisismyname\" }" \
      --query StatusCode \
      test-response.json
  )"

  if [ "$code" != 200 ]; then
    echo "Failed with code: $code"
    exit 1
  fi

  echo -n "OK: " && cat test-response.json && echo
}

invoke_lambda $python_lambda_arn:live
invoke_lambda $nodejs_lambda_arn:live
