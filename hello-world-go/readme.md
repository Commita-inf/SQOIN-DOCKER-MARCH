# Go Docker Example

This is a simple GO project that runs in a Docker container and displays a "Hello SQOIN" message. The changes made to the code on the local machine are automatically synced to the container code without the need to install dependencies on the local machine.

## Requirements

- Docker
- Go

## How to Use

1. Clone this repository and go to node example:

`git clone https://github.com/Commita-inf/sqoin-tut-march.git`

2. Build a Docker image for your project using the following command:

`docker build -t hello-go-image .`

3. Start a new Docker container using the following command:

`docker run -t -p 8080:8080 -v $(pwd):/app --name hello-go-container hello-go-image`

This command starts a new container from the `hello-go-image` image, maps port 8080 from the container to port 8080 on your local machine, and mounts the current directory as a volume in the container.

4. Visit `http://localhost:8080/helloworld` in your web browser to see the "Hello SQOIN" message.

5. Now, if you make changes to `main.go` on your local machine, the changes will be automatically synced to the container code and the container will restart with the new code.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
