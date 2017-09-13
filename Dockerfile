FROM alpine

ENV PATH="/root/.yarn/bin:${PATH}"

MAINTAINER Martin Venuš "martin.venus@gmail.com"

RUN apk --update add nodejs curl gnupg && \
    curl -o- -L https://yarnpkg.com/install.sh | bash && \
    mkdir -p /app

WORKDIR "/app"
VOLUME ["/app"]

CMD ["yarn"]
