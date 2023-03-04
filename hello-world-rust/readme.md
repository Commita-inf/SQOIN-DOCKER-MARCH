# Rust Docker Hello World

This is a simple Rust program that displays "HELLO SQOIN" and runs inside a Docker container.

## Requirements

To repeat this project, you will need:

- Docker (https://docs.docker.com/get-docker/)

## Steps

### 1. Create a new Rust program

Create a new Rust program by creating a file named `myprogram.rs` with the following contents:

```
fn main() {
println!("HELLO SQOIN");
}
```

### 2. Create a Dockerfile

Create a file named `Dockerfile` in the same directory as `myprogram.rs` with the following contents:

```
FROM rust:latest

WORKDIR /app

COPY myprogram.rs .

RUN rustc myprogram.rs

CMD ["/app/myprogram"]
```

This Dockerfile sets the working directory to `/app`, copies the `myprogram.rs` file into the container, compiles the program using `rustc`, and then runs the resulting binary with the `CMD` command.

### 3. Build the Docker container

To build the Docker container, navigate to the directory containing `myprogram.rs` and `Dockerfile` in a terminal and run the following command:

`docker build -t hello-rust-image .`

This will build a Docker image with the tag `myprogram`.

### 4. Run the Docker container

To run the Docker container and see the "HELLO SQOIN" output, run the following command:

`docker run -t -v $(pwd):/app --name hello-rust-container hello-rust-image`

This should output `HELLO SQOIN` in the terminal.

## Conclusion

You have successfully created a Rust program that runs inside a Docker container! You can modify the Rust program and Dockerfile to suit your needs, and build and run the container on any system with Docker installed.
