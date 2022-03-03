#!/bin/sh
# P8 file path
P8_FILE="./apns.p8"
AUTH_KEYID=JTCGQQ4U67
AUTH_TEAMID=M7X4S97D8V

# bundle id
TOPIC="com.lizhi.pchat"
# token
TOKEN="ac2e1f4edefea8199e3a699ecfe971dac85e389e2990aba0ee385cf747c863e0"


# production environment
# APNS_HOST_NAME=api.push.apple.com
# development environment
APNS_HOST_NAME=api.development.push.apple.com
read -r -d '' PAYLOAD <<-'EOF'
{
   "aps": {
      "badge": 2,
      "sound": "default",
      "alert": {
         "title": "标题",
         "subtitle": "副标题",
         "body": "test from dawenhing"
      }
   },
   "custom": {
      "mykey": "myvalue"
   }
}
EOF

# --------------------------------------------------------------------------
base64() {
   openssl base64 -e -A | tr -- '+/' '-_' | tr -d =
}

sign() {
   printf "$1"| openssl dgst -binary -sha256 -sign "$P8_FILE" | base64
}

TIMESTAMP=$(date +%s)
HEADER=$(printf '{ "alg": "ES256", "kid": "%s" }' "$AUTH_KEYID" | base64)
CLAIMS=$(printf '{ "iss": "%s", "iat": %d }' "$AUTH_TEAMID" "$TIMESTAMP" | base64)
JWT="$HEADER.$CLAIMS.$(sign $HEADER.$CLAIMS)"

curl --verbose \
   --header "content-type: application/json" \
   --header "authorization: bearer $JWT" \
   --header "apns-topic: $TOPIC" \
   --data "$PAYLOAD" \
   https://$APNS_HOST_NAME/3/device/$TOKEN
