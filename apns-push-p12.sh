#!/bin/sh
# P12 file path
P12_FILE="./apns.p12"

# bundle id
TOPIC="com.huanliao.tiya"
# token
TOKEN="23205e15fd54da1e82e188534c402f5a8aa89176b1b4577d0222f578c32304dc"

# production environment
# APNS_HOST_NAME=api.push.apple.com
# development environment
APNS_HOST_NAME=api.development.push.apple.com

read -r -d '' PAYLOAD <<-'EOF'
{
    "aps": {
        "content-available" : 1,
        "sound": "default",
        "alert": {
            "key" : "{\"action\":{\"appData\":\"{}\",\"IM5\":{\"fromId\":\"5100881883546282028\",\"svrMsgId\":\"27962305233898833\",\"report\":\"{\\\"channel\\\":5}\",\"targetId\":\"5100123136771272236\",\"msgType\":1,\"convType\":1}}}",
            "title": "标题",
            "subtitle": "副标题",
            "body": "test from dawenhing"
        }
    },
    "IM5": {
        "mykey": "myvalue"
    }
}
EOF
python -c "import sys,json;p=r'''${PAYLOAD}''';print(p);json.loads(p);"

# only support p12 without passphrase
curl \
    --header "apns-topic: ${TOPIC}" \
    --header "apns-push-type: alert" \
    --cert-type P12 --cert "${P12_FILE}" \
    --data "$PAYLOAD" \
    --http2  "https://${APNS_HOST_NAME}/3/device/${TOKEN}"
