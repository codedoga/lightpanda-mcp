FROM node:22-slim AS deps
RUN npm install -g supergateway@3.4.3

FROM gcr.io/distroless/nodejs24-debian13

COPY --from=deps /usr/local/lib/node_modules/supergateway /usr/local/lib/node_modules/supergateway
COPY --from=lightpanda/browser:nightly /usr/bin/lightpanda /lightpanda
COPY entrypoint.sh entrypoint.sh
COPY --from=busybox:stable /bin/sh /bin/sh

ENTRYPOINT ["/bin/sh"]
CMD ["/entrypoint.sh"]