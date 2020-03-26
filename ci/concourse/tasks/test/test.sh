#!/bin/sh

set -eu
uname -a
ls -lRta

curl -u ${harbor.username}:${harbor.password} -k  --header "Content-Type: application/json" -X GET "https://((harbor.host))/api/repositories/hemanth/pks-demo/tags/1.16.289" > /tmp/apple.json

cat /tmp/apple.json | yq r - "scan_overview.*.severity"