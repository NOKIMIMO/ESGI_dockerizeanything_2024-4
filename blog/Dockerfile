FROM rustlang/rust:nightly as builder

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gnupg \
    gcc \
    libpq-dev

COPY . /app
WORKDIR /app

RUN cargo install --path .

RUN cargo install diesel_cli --no-default-features --features postgres

RUN diesel migration run

RUN cp /usr/local/cargo/bin/blog ./blog

EXPOSE 8000

CMD ["./blog"]