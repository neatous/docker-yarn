FROM debian:bookworm
MAINTAINER Martin Venuš "martin.venus@gmail.com"

ENV NODE_MAJOR=22
ENV PATH="/root/.yarn/bin:${PATH}"

RUN apt-get -y update && \
    apt-get -y install bash build-essential ca-certificates curl git gnupg gpg zlib1g-dev

RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${NODE_MAJOR}.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && \
    apt-get install nodejs -y

RUN curl -o- -L https://yarnpkg.com/install.sh | sh -s && \
    mkdir -p /app

RUN mkdir -p /root/.ssh && \
    ssh-keyscan github.com >> /root/.ssh/known_hosts

WORKDIR "/app"
VOLUME ["/app"]

CMD ["yarn"]
