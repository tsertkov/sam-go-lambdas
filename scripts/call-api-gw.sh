#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../" && pwd )"
stack_name="$(sed -ne 's/^stack_name = "\(.*\)"$/\1/p' "${DIR}/samconfig.toml")"
api_url="$( \
  aws cloudformation describe-stacks \
    --stack-name "$stack_name" \
    --query 'Stacks[].Outputs[?OutputKey==`ApiUrl`].OutputValue' \
    --output text
)"

echo curl "${api_url}/echo/status"
curl "${api_url}/echo/status"
echo

echo curl "${api_url}/gin/status"
curl "${api_url}/gin/status"
echo

