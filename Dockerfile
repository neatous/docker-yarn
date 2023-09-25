FROM debian:bookworm
MAINTAINER Martin Venuš "martin.venus@gmail.com"

ENV PATH="/root/.yarn/bin:${PATH}"

RUN apt-get -y update && \
    apt-get -y install bash curl git gpg zlib1g-dev

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -  && \
    apt-get install -y nodejs

RUN curl -o- -L https://yarnpkg.com/install.sh | sh -s && \
    mkdir -p /app

RUN mkdir -p /root/.ssh && \
    ssh-keyscan github.com >> /root/.ssh/known_hosts

WORKDIR "/app"
VOLUME ["/app"]

CMD ["yarn"]
