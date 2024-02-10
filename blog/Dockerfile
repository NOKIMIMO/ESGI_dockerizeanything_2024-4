FROM rustlang/rust:nightly as builder

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gnupg \
    gcc \
    libpq-dev

COPY . /app
WORKDIR /app

RUN cargo install --path .

FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gnupg \
    gcc \
    libpq-dev

COPY --from=builder /app/* /app/blog/

COPY static /app/blog/

RUN ls -la