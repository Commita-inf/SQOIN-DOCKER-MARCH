# C Project with Docker

This is a simple C project that demonstrates how to run a "Hello, World!" program in a Docker container. The project consists of a single C source file (`hello_world.c`) and a Dockerfile (`Dockerfile`) that defines the Docker image.

## Prerequisites

Before you can run this project, you'll need to have the following software installed on your system:

- Docker

You can download and install Docker from the official Docker website: https://www.docker.com/get-started

## Building the Docker Image

To build the Docker image for this project, follow these steps:

1. Clone this repository to your local machine:
   `git clone https://github.com/Commita-inf/sqoin-tut-march.git`

2. Navigate to the project directory:
   `cd hello-world-c`

3. Build the Docker image using the following command:
   `docker build -t hello-world-c-image .`

## Running the Docker Container

To run the Docker container for this project, follow these steps:

1. Start the Docker container using the following command:
   `docker run  --name hello-world-c-container hello-world-c-image`

This will start a new Docker container based on the my_project image and execute the hello_world program inside it.

2. You should see the output "Hello, World!" printed to the console.

That's it! You've successfully built and run a "Hello, World!" program in a Docker container.
