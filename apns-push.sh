#!/bin/sh
# P12 fiel path
P12_FILE="./apns.p12"

# bundle id
TOPIC="com.xxx.app"
# token
TOKEN="6870efa0bbd9ba50412a3ee96aaee9ed152c897b48016acf602d4892bbfba112"

# production environment
# APNS_HOST_NAME=api.push.apple.com
# development environment
APNS_HOST_NAME=api.development.push.apple.com

# only support p12 without passphrase
curl -vso \
    --header "apns-topic: ${TOPIC}" \
    --header "apns-push-type: alert" \
    --cert-type P12 --cert "${P12_FILE}" \
    --data '{"aps":{"alert":"test from dawenhing"}}' \
    --http2  "https://${APNS_HOST_NAME}/3/device/${TOKEN}"

# PEM reqeust way
# use`apns-p12-gen-pem.sh` generate pem file from p12

# CERT_FILE="./tiya_apns_cert.pem"
# KEY_FILE="./tiya_apns_key.pem"
# curl -vso \
#     --header "apns-topic: ${TOPIC}" \
#     --header "apns-push-type: alert" \
#     --cert "${CERT_FILE}" --cert-type PEM \
#     --key "${KEY_FILE}" --key-type PEM \
#     --data '{"aps":{"alert":"test from dawen"}}' \
#     --http2  "https://${APNS_HOST_NAME}/3/device/${TOKEN}"