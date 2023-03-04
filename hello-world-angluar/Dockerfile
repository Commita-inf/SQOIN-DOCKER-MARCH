# base image
FROM node:latest

# set working directory
WORKDIR /app

# copy package.json and package-lock.json
COPY package*.json ./

# install dependencies
RUN npm install

# copy app source code
COPY . .

# build the app
RUN npm run build

# expose port
EXPOSE 4200

# start the app
CMD ["npm", "start", "--host", "0.0.0.0", "--port", "4200"]
