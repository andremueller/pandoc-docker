ARG VERSION=latest
FROM pandoc-core:${VERSION}

# install latex packages
RUN apt-get update --yes && apt-get install --yes --no-install-recommends -o Acquire::http::Pipeline-Depth=0 \
-o Acquire::Retries=10 texlive-latex-base texlive-xetex texlive-science-doc texlive-science \
 texlive-latex-extra texlive-fonts-extra texlive-bibtex-extra fontconfig lmodern \
 && apt-get update --fix-missing \
 && apt-get autoremove --yes && apt-get clean

WORKDIR /data
ENTRYPOINT ["/root/.cabal/bin/pandoc"]
CMD ["--help"]

LABEL description="Pandoc + latex core docker image"
