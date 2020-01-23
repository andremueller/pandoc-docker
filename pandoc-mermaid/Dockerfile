FROM pandoc-latex:latest

RUN apk add --no-cache nodejs npm chromium nss freetype freetype-dev harfbuzz \
	ca-certificates ttf-freefont

ENV CHROME_BIN="/usr/bin/chromium-browser" \
	NODE_ENV="production" \
	PUPPETEER_SKIP_CHROMIUM_DOWNLOAD="true"
RUN apk add --no-cache yarn
RUN yarn global add mermaid-filter --prefix /usr/local

LABEL maintainer="Andre Mueller <andre@kiwisound.de>"
LABEL description="Pandoc + latex + mermaid docker image"
LABEL version="$VERSION"
WORKDIR /data

ENTRYPOINT ["/usr/local/bin/pandoc"]

CMD ["--help"]

