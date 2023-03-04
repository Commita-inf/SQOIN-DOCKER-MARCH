# Node.js Docker Example

This is a simple Node.js project that runs in a Docker container and displays a "Hello SQOIN" message. The changes made to the code on the local machine are automatically synced to the container code without the need to install dependencies on the local machine.

## Requirements

- Docker

## How to Use

1. Clone this repository and go to node example:

`git clone https://github.com/Commita-inf/sqoin-tut-march.git`

2. Build a Docker image for your project using the following command:

`docker build -t hello-node-image .`

3. Start a new Docker container using the following command:

`docker run -itd -p 3000:3000 -v $(pwd):/app -v /app/node_modules --name hello-node-container hello-node-image`

This command starts a new container from the `hello-node-image` image, maps port 3000 from the container to port 3000 on your local machine, and mounts the current directory as a volume in the container.

4. Visit `http://localhost:3000` in your web browser to see the "Hello SQOIN" message.

5. Now, if you make changes to `index.js` on your local machine, the changes will be automatically synced to the container code and the container will restart with the new code.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
