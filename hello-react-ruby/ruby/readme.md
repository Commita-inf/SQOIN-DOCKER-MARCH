# Ruby server Docker Example

This is a simple Ruby servert that runs in a Docker container and displays a list of articles.

## Requirements

- Docker

## How to Use

1. Clone this repository and go to ruby-react example and to ruby server:

`git clone https://github.com/Commita-inf/sqoin-tut-march.git`

2. Build a Docker image for your project using the following command:

`docker build -t ruby-server-image .`

3. Start a new Docker container using the following command:

`docker run -t -p 4567:4567 ruby-server-image`

This command starts a new container from the `ruby-server-image` image, maps port 4567 from the container to port 4567 on your local machine, and mounts the current directory as a volume in the container.

4. Visit `http://localhost:4567/articles` in your web browser to see the list.

