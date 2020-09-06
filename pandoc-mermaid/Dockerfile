FROM pandoc-latex:latest

RUN apk add --no-cache nodejs npm chromium nss freetype freetype-dev harfbuzz \
	ca-certificates ttf-freefont

# ENV CHROME_BIN="/usr/bin/chromium-browser"
ENV	NODE_ENV="production" \
	PUPPETEER_SKIP_CHROMIUM_DOWNLOAD="false"

# chromium
RUN apk add --no-cache \
	  nss \
	  freetype \
	  freetype-dev \
	  harfbuzz \
	  ca-certificates \
	  ttf-freefont \
	  nodejs \
	  yarn

RUN /usr/bin/chromium-browser --version

# Add user so we don't need --no-sandbox.
RUN addgroup -S pptruser && adduser -S -g pptruser pptruser \
	&& mkdir -p /home/pptruser /app /data \
	&& chown -R pptruser:pptruser /home/pptruser \
	&& chown -R pptruser:pptruser /app \
	&& chown -R pptruser:pptruser /data

# Run everything after as non-privileged user.
USER pptruser
WORKDIR /app
RUN yarn add puppeteer@2.0.0 mermaid-filter mermaid.cli --prefix=/app && yarn install --prefix=/app
COPY pandoc-mermaid/puppeteer-config.json /app
ENV PATH "/app/node_modules/.bin:$PATH"
RUN rm -rf /tmp/*
LABEL maintainer="Andre Mueller <andre@kiwisound.de>"
LABEL description="Pandoc + latex + mermaid docker image"
LABEL version="$VERSION"
WORKDIR /data

ENTRYPOINT ["/usr/local/bin/pandoc"]

CMD ["--help"]
