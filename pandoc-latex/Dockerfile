ARG VERSION=latest

FROM pandoc-core:$VERSION

LABEL maintainer="Andre Mueller <andre@kiwisound.de>"
LABEL description="Pandoc + latex core docker image"
LABEL version="$VERSION"

RUN bash -c echo "Proxy settings: http_proxy=$http_proxy https_proxy=$https_proxy"

# install latex packages
RUN apt-get update --yes && apt-get install --yes --no-install-recommends -o Acquire::http::Pipeline-Depth=0 -o Acquire::Retries=10 texlive-latex-base texlive-xetex latex-xcolor texlive-math-extra texlive-latex-extra texlive-fonts-extra texlive-bibtex-extra fontconfig lmodern
RUN apt-get update --fix-missing
RUN apt-get autoremove --yes
RUN apt-get clean

WORKDIR /data

ENTRYPOINT ["/root/.cabal/bin/pandoc"]

CMD ["--help"]
