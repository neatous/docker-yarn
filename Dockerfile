FROM alpine

MAINTAINER Martin Venuš "martin.venus@gmail.com"

RUN apk --update add nodejs curl bash gnupg

touch $HOME/.profile

curl -o- -L https://yarnpkg.com/install.sh | bash

mkdir -p /app

WORKDIR "/app"
VOLUME ["/app"]

CMD ["/root/.yarn/bin/yarn"]
