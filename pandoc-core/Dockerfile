FROM haskell:8.6.5

LABEL maintainer="Andre Mueller <andre@kiwisound.de>"
LABEL description="Pandoc core image"
LABEL version="${VERSION}"

RUN bash -c echo "Proxy settings: http_proxy=$http_proxy https_proxy=$https_proxy"

# install pandoc
RUN cabal update --verbose
RUN cabal new-install --verbose pandoc

WORKDIR /data

ENTRYPOINT ["/root/.cabal/bin/pandoc"]

CMD ["--help"]
