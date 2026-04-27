#!/bin/sh

set -eu

exec /nodejs/bin/node /usr/local/lib/node_modules/supergateway/dist/index.js \
    --stdio "/lightpanda mcp --log_level info" \
    --outputTransport "streamableHttp" \
    --stateful \
    --cors