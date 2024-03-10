docker run -d -p 5432:5432 \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_USER=postgres \
  -v pgdata:/var/lib/postgresql/data \
  pg-cont
