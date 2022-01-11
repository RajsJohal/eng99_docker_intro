# Docker

## What is it?
- A containerisation microservice tool, open platform for developing, shipping and running applications. Enables you to seperate your application from your infrastructure in order to deliver software quickly. 
- Bundle application, its dependencies and its configurations into a single image which is running in isolated user environments on a traditional OS on a traditional server or in a virualiation environment. 
- Virtualisation enables you to run multiple OS's on the hardware of a single physical server while containerisation enables you to deploy multiple applications using the same OS on a single virtual machine or server. 

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
- Download docker and create a Docker Hub Account
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
