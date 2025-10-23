#!/bin/bash

sudo apt install haproxy

sudo systemctl start haproxy && sudo systemctl enable haproxy

sudo nano /etc/haproxy/haproxy.cfg

# Create route on one of the apisix nodes

curl -i -X PUT http://127.0.0.1:9180/apisix/admin/routes/health \
-H "X-API-KEY: <api_key>" \
-d '{
"uri": "/health",
"name": "health-check",
"methods": ["GET"],
"plugins": {
"mocking": {
"response_status": 200,
"response_example": "{\"status\": \"healthy\"}"
}
}
}'

# Check route

curl http://127.0.0.1:9180/apisix/admin/routes?api_key=<api_key> -i

# Test health
curl -i http://127.0.0.1:9080/health
