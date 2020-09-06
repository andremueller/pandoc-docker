FROM alpine:latest

RUN apk add --upgrade --virtual .build --no-cache curl tar
WORKDIR /tmp
ARG PANDOC_VERSION="2.10.1"
ARG PANDOC_URL="https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz"
RUN curl -L "${PANDOC_URL}" | tar xz \
	&& cp /tmp/pandoc-${PANDOC_VERSION}/bin/* /usr/local/bin \
	&& rm -rf /tmp/*

ARG PANDOC_CROSSREF="v0.3.8.1"
ARG PANDOC_CROSSREF_URL="https://github.com/lierdakil/pandoc-crossref/releases/download/${PANDOC_CROSSREF}/pandoc-crossref-Linux.tar.xz"
RUN curl -L  "${PANDOC_CROSSREF_URL}" | tar -x -J \
	&& cp /tmp/pandoc-crossref /usr/local/bin \
	&& rm -rf /tmp/*

WORKDIR /data

ARG VERSION
LABEL maintainer="Andre Mueller <andre@kiwisound.de>"
LABEL description="Pandoc core image"
LABEL version="$VERSION"

ENTRYPOINT ["/usr/local/bin/pandoc"]

CMD ["--help"]
