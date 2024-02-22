FROM rustlang/rust:nightly

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc \
    libpq-dev

RUN cargo install diesel_cli --no-default-features --features postgres

COPY . /app
WORKDIR /app

RUN cargo install --path .

EXPOSE 8000

RUN cp /usr/local/cargo/bin/blog ./blog

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]