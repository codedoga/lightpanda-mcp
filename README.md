# lightpanda-mcp

A Docker image that exposes [Lightpanda](https://lightpanda.io) browser's native MCP server over HTTP using Streamable HTTP transport.

Lightpanda provides MCP via stdio. This project wraps it with [supergateway](https://github.com/supercorp-ai/supergateway) to expose it as an HTTP endpoint, making it usable by remote MCP clients.

## Quick start

```bash
docker compose up --build
```

The MCP endpoint will be available at `http://localhost:8000/mcp`.

## How it works

Lightpanda has a built-in MCP server that communicates over stdio (`lightpanda mcp`). Supergateway bridges this to Streamable HTTP, so any MCP client that supports HTTP transport can connect.

The Docker image is built on [`gcr.io/distroless/nodejs24-debian13`](https://github.com/GoogleContainerTools/distroless) for a minimal footprint (~424MB uncompressed). It uses a multi-stage build to pull in only the necessary components:

- **Lightpanda binary** — from [`lightpanda/browser:nightly`](https://hub.docker.com/r/lightpanda/browser)
- **Supergateway** — npm modules installed via [`node:22-slim`](https://hub.docker.com/_/node), then copied to the final image
- **Busybox `/bin/sh`** — required because supergateway spawns the stdio command via a shell

## Links

- Lightpanda: [website](https://lightpanda.io) · [GitHub](https://github.com/lightpanda-io/browser) · [Docker Hub](https://hub.docker.com/r/lightpanda/browser)
- Supergateway: [GitHub](https://github.com/supercorp-ai/supergateway) · [npm](https://www.npmjs.com/package/supergateway) · [Docker Hub](https://hub.docker.com/r/supercorp/supergateway)
