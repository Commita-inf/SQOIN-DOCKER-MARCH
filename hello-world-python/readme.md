# Flask App with Docker

This is a simple Flask app that runs in a Docker container and displays a list of articles.

## Prerequisites

Before starting, you'll need to have the following:

- Docker installed on your machine
- Git installed on your machine

## Getting Started

To get started, follow these steps:

1. Clone this repository to your local machine:
   `git clone https://github.com/Commita-inf/sqoin-tut-march.git`

2. Navigate to the project directory:

3. Build the Docker image:
   `docker build -t hello-python-image .`

4. Run the Docker container:
   `docker run -p 5000:5000 -v $(pwd):/app --name hello-python-container hello-python-image`

5. Open a web browser and navigate to `http://localhost:5000`. You should see a list of articles displayed in your browser.

## Modifying the Code

To modify the code and see the changes reflected in the Docker container, follow these steps:

1. Modify the code in `app.py` to make the desired changes.

2. Rebuild the Docker image:
