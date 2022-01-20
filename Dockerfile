FROM cirrusci/flutter:dev AS build

WORKDIR /build

RUN flutter clean && \
    flutter pub cache repair && \
    flutter config --enable-web && \
    apt-get update \
    && apt-get install -y chromium-browser \
    && rm -rf /var/lib/apt/lists/* && \
    flutter pub get

COPY . .

CMD ["flutter","run", "-d", "web-server", "--web-port 8000 --web-hostname 0.0.0.0"]