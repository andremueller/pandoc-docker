ARG VERSION=latest

FROM pandoc-latex:$VERSION

LABEL maintainer="Andre Mueller <andre@kiwisound.de>"
LABEL description="Pandoc + latex + mermaid docker image"
LABEL version="$VERSION"

RUN bash -c echo "Proxy settings: http_proxy=$http_proxy https_proxy=$https_proxy"

# install latex packages
RUN apt-get update --yes && apt-get install --yes --no-install-recommends -o Acquire::http::Pipeline-Depth=0 -o Acquire::Retries=10 curl build-essential
RUN curl -sL https://deb.nodesource.com/setup_8.x |bash -
RUN apt-get install nodejs
RUN apt-get update --fix-missing
RUN apt-get autoremove --yes
RUN apt-get clean

# install npm packages
RUN npm --loglevel info --proxy $http_proxy install --global --unsafe-perm=true mermaid-filter

WORKDIR /data

ENTRYPOINT ["/root/.cabal/bin/pandoc"]

CMD ["--help"]
