FROM rust:latest as build
WORKDIR /usrc/src/app
COPY ./Cargo.lock ./Cargo.toml ./
RUN mkdir src && \
  echo "fn main() {println!(\"dummy\");}" > src/main.rs && \
  cargo build --release && \
  rm -f src/main.rs

COPY . .
RUN cargo build --release
EXPOSE 7676
cmd ["target/relase/library-api"]
