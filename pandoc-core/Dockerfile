FROM alpine:latest

ARG PANDOC_VERSION="2.9"
ARG PANDOC_URL="https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz"

RUN apk add --virtual .build --no-cache curl
WORKDIR /tmp
RUN curl -L "${PANDOC_URL}" | tar xvz && cp /tmp/pandoc-${PANDOC_VERSION}/bin/* /usr/local/bin && rm -rf /tmp/*

WORKDIR /data

ARG VERSION
LABEL maintainer="Andre Mueller <andre@kiwisound.de>"
LABEL description="Pandoc core image"
LABEL version="$VERSION"

ENTRYPOINT ["/usr/local/bin/pandoc"]

CMD ["--help"]

