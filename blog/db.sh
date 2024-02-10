#!/bin/bash
service postgresql start
service postgresql status
psql -c "CREATE ROLE user1 WITH LOGIN PASSWORD 'user1';" && \
    createdb -O user1 myapp && \
    psql -d myapp -c "ALTER ROLE user1 CREATEDB;"
createdb -U user1 myapp