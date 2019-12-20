ARG VERSION=latest

FROM pandoc-core:$VERSION

RUN apk add --no-cache texlive-xetex

LABEL maintainer="Andre Mueller <andre@kiwisound.de>"
LABEL description="Pandoc + latex core docker image"
LABEL version="$VERSION"

WORKDIR /data
ENTRYPOINT ["/usr/local/bin/pandoc"]
CMD ["--help"]

