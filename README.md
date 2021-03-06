# Docker

## What is it?
- A containerisation microservice tool, open platform for developing, shipping and running applications. Enables you to seperate your application from your infrastructure in order to deliver software quickly. 
- Bundle application, its dependencies and its configurations into a single image which is running in isolated user environments on a traditional OS on a traditional server or in a virualiation environment. 
- Virtualisation enables you to run multiple OS's on the hardware of a single physical server while containerisation enables you to deploy multiple applications using the same OS on a single virtual machine or server. 

## Containers
- A runnable instance of an image
- Can be run on a local machines, virtual machines or deploying to the cloud
- Portable (Can be run an any OS)
- Containers are isolated from each other and run their own software, binaries and configurations 

## Benefits
- Portability between different platforms and clouds. Write once and run anywhere
- Efficiency through using far fewer resources than VM's and delivering higher utilization of compute resources. 
- Agility that allows developers to integrate with their existing DevOps environment.
- Higher speed in the delivery of enhancements. Containerising monolithic applications using microservices helps dev teams create functionality with its own life cycle and scaling policies. 
- Improved security by isloating applications from the host system and from each other
- Faster app start-up and easier scaling
- Flexibility to work on virtualized infrastructures or on bare  metal servers
- Easier management since install, upgrade, and rollback processes are built into the Kubernetes platform. 

#### Installation and Set Up
- [Download docker](https://docs.docker.com/desktop/windows/install/) and create a [Docker Hub Account](https://hub.docker.com)
- Enable the WSL 2 Settings 
- Check hyper -v settings on windows machines

#### Docker Images
- A package of services or code 
- Facilitates and provides a container with all the neccessary dependencies


#### Docker Commands
- `docker images` - lists all images
- `docker pull image-name`
- `docker run image-name`
- `docker build -t image-name`
- `docker push image-name`
- `docker run -d -p 2368:2368 ghost` runs the container 
- how to check running container, `docker ps` and `docker ps -a`
* To copy a file from local host to a container, e.g. running this command from the file where index.html is located on local machine, specify container ID and path where the file should go within container. `docker cp index.html afba0d1ec1a6:/usr/share/nginx/html`


#### Docker Container lifecycle
- `running state, stop and start`
- Interact with running container, use `docker ps` to check running containers then use the container ID whenever you want to interact ith it. 
- `docker exec -it container_id bash` to interact with container

#### Nginx
- `docker pull nginx` 
- `cd usr/share/nginx/html`
- `apt install nano`
- `nano index.html` Edit the <h1> tab to display Welcome to Eng99 DevOps Group

#### Docker Commit/Push
* `docker commit CONTAINER_ID dockerhubusername/imagename:TAG`
* For my commit - `docker commit cea4d5dcb504 rajsjohal/eng99_my_nginx:latest`
* `docker images` will list all images and we can see the image `rajsjohal/eng99_my_nginx` 
* `docker push rajsjohal/eng99_my_nginx` pushes the image to my dockerhub and creates a new repo called rajsjohal/eng99_my_nginx
* Tags are similar to commit messages, update tags when you push to docker

#### Dockerfile
* A simple Dockerfile which can run within the specified container, in this case we update and upgrade the nginx container and replace the contents of the html file with a header.
- A docker file is always called `Dockerfile` without any extension
- Some commands we can use in a Dockerfile are as follows:
  - `FROM` - Selects the image you wish to refer to within the Dockerfile
  - `RUN` - Executes a command line during the building of the image
  - `CMD` - Runs within the container after the container has been built from a image
  - `WORKDIR` - Specify the working directory within the container
  - `EXPOSE` - Selects the port which the container should be running
  - `COPY` - adds files from you Docker client's current directory 
  - Refer to this [Dockerfile Documentation](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)

- Below we have a basic Docker file, demonstrates the syntax and what commands can be run. This file simply replaces the contents of the nginx index.html file so we can see the heading 'Docker Success' whenever we run the container with this nginx index.html file. This Dockerfile runs within the container. 
```
FROM nginx

RUN apt update -y
RUN apt upgrade -y

WORKDIR /usr/share/nginx/html
RUN echo "<h1>Docker Success!<h1>" > index.html


EXPOSE 80
```
- A Dockerfile can be used to build a Docker Image
- `docker build` to build the Dockerfile
- The image you have just created can then be run

#### Docker Compose
- Compose is a tool for defining and running multi-container Docker apps. With compose, you use a YAML file to configure the apps services. You can then create and start all the services from your configuration. 
- Compose works in 3 steps:
  - Define your app's environment with a `Dockerfile` so it can be reproduced anywhere
  - Define the services that make up your app in `docker-compose.yml`
  - Run `docker compose up` 
* Simple `docker-compose.yml` file
```
services:
  nginx_server:
    image: nginx:latest
    ports: 
      - "10:10"
  
  nginx_server2:
    image: nginx:latest
    ports:
      - "81:81"
```
* Run `docker compose build` then `docker compose up`
* `docker compose down`

