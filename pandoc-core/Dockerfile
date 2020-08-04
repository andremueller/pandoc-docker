FROM haskell:8.6.5

RUN cabal update --verbose && \
    cabal new-install --verbose pandoc

WORKDIR /data

ENTRYPOINT ["/root/.cabal/bin/pandoc"]
CMD ["--help"]
LABEL maintainer="Andre Mueller <andre@kiwisound.de>"
LABEL description="Pandoc core image"
