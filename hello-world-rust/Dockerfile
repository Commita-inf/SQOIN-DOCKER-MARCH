FROM rust:latest

WORKDIR /app

COPY myprogram.rs .

RUN rustc myprogram.rs

CMD ["/app/myprogram"]

