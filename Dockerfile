FROM alpine
MAINTAINER Martin Venuš "martin.venus@gmail.com"

ENV PATH="/root/.yarn/bin:${PATH}"

RUN apk --update add bash curl gnupg nodejs && \
    curl -o- -L https://yarnpkg.com/install.sh | bash && \
    mkdir -p /app

WORKDIR "/app"
VOLUME ["/app"]

CMD ["yarn"]
