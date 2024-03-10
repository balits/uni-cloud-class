use anyhow::Context;
use sqlx::{postgres::PgPoolOptions, Pool, Postgres};

mod handlers;
mod models;

use axum::{routing::get, Router};

#[tokio::main]
async fn main() -> anyhow::Result<()> {
    let pool = PgPoolOptions::new()
        .max_connections(4)
        .connect("postgres://petiyeti:petiyeti@localhost/elte_felho_konyvek")
        .await
        .context("could not connect to postgres database")?;

    let app = Router::new()
        .route("/books", get(handlers::book_handler::index))
        .route("/books/:id", get(handlers::book_handler::by_id))
        .with_state(pool);

    let addr = "127.0.0.1:7676";

    axum::Server::bind(&addr.parse().unwrap())
        .serve(app.into_make_service())
        .await
        .unwrap();

    Ok(())
}
