#!/bin/sh
# P12 file path
P12_FILE="./apns.p12"

# bundle id
TOPIC="com.huanliao.tiya"
# token
TOKEN="953c91443d52c699c25887ea216b1a217762c158df5a24ee514c3a6cc8582770"

# production environment
# APNS_HOST_NAME=api.push.apple.com
# development environment
APNS_HOST_NAME=api.development.push.apple.com

# only support p12 without passphrase
curl --verbose \
    --header "apns-topic: ${TOPIC}" \
    --header "apns-push-type: alert" \
    --cert-type P12 --cert "${P12_FILE}" \
    --data '{"aps":{"alert":"test from dawenhing"}}' \
    --http2  "https://${APNS_HOST_NAME}/3/device/${TOKEN}"
