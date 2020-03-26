#!/bin/sh

set -eu
uname -a

#wget -O /tmp/scan.json --no-check-certificate  --header "Authorization: Basic ${HARBOR_PASSWORD}" --header "Content-Type: application/json" https://${HARBOR_HOST}/api/repositories/hemanth/pks-demo/tags/1.16.289
wget -O /tmp/scan.json --no-check-certificate  --header "Authorization: Basic ${HARBOR_PASSWORD}" --header "Content-Type: application/json" https://${HARBOR_HOST}/api/repositories/caas-workshop/mysql:latest


Result=`cat /tmp/scan.json | yq r - "scan_overview.*.severity"`

if [ "$Result" != "High" ] ; then
    echo "Container Images don't have vulnerability of defined High threshold"
else
    echo "Container Images has vulnerability of severity of High and above. Failing the step"
    exit 1
fi

if [ "$Result" != "Critical" ] ; then
    echo "Container Images don't have vulnerability of Critical threshold. Passing the step."
else
    echo "Container Images has vulnerability of severity of Critical and above. Failing the step"
    exit 1
fi