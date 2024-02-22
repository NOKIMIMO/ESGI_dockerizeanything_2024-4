FROM rustlang/rust:nightly

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc \
    netcat \
    libpq-dev

RUN cargo install diesel_cli --no-default-features --features postgres
ENV DATABASE_URL=postgres://user1:user1@blog_db:5432/blog
#DONNE ACCES A TOUS LES RESEAUX
ENV ROCKET_ADDRESS=0.0.0.0

COPY . /app
WORKDIR /app

RUN cargo install --path .

EXPOSE 8000

RUN cp /usr/local/cargo/bin/blog ./blog

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]