ARG VERSION=latest

FROM pandoc-latex:$VERSION

RUN apk add --no-cache nodejs-current npm
RUN npm install --loglevel info --global --unsafe-perm=true mermaid-filter

LABEL maintainer="Andre Mueller <andre@kiwisound.de>"
LABEL description="Pandoc + latex + mermaid docker image"
LABEL version="$VERSION"
WORKDIR /data

ENTRYPOINT ["/usr/local/bin/pandoc"]

CMD ["--help"]

