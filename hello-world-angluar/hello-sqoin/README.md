# Angular Hello Sqoin

This project is a simple Angular app that displays "HELLO SQOIN" and can be run in a Docker container.

## Prerequisites

Before getting started, you will need to install the following software:

- Node.js (https://nodejs.org/en/download/)
- Angular CLI (https://angular.io/guide/setup-local)

## Getting started

Follow these steps to create the Angular app and run it in a Docker container:

1. Create a new Angular project:

`ng new hello-sqoin`

2. Change directory into the new project:

`cd hello-sqoin`

3. Update the `app.component.html` file:

- Open the `src/app/app.component.html` file
- Replace the content with: `<h1>HELLO SQOIN</h1>`

4. Build the Angular project:

`ng build`

5. Create a Dockerfile:

- Create a new file named `Dockerfile` in the project directory
- Add the following content to the file:

`FROM nginx:alpine`
`COPY dist/hello-sqoin /usr/share/nginx/html`

6. Build a Docker image:

`docker build -t hello-angular-image .`

7. Run the Docker container:

`docker run -d -p 80:80 --name hello-angular-container hello-angular-image`

8. Verify the Angular app is running in the Docker container:

- Open a web browser and navigate to `http://localhost:80`
- You should see "HELLO SQOIN" displayed in the browser

That's it! You now have an Angular app running in a Docker container.
