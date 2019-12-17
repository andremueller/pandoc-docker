ARG VERSION

FROM alpine:latest

RUN apk add --virtual .build --no-cache wget ghc cabal build-base
RUN cabal new-update --verbose
RUN cabal new-install Cabal cabal-install 
RUN cabal new-install --verbose pandoc

WORKDIR /data

LABEL maintainer="Andre Mueller <andre@kiwisound.de>"
LABEL description="Pandoc core image"
LABEL version="$VERSION"

ENTRYPOINT ["/root/.cabal/bin/pandoc"]

CMD ["--help"]

