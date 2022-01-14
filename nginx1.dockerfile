FROM nginx

RUN apt update -y
RUN apt upgrade -y

ENV DB_HOST=mongodb://mongodb:27017/posts

WORKDIR /usr/share/nginx/html
RUN echo "<h1>Docker Success!<h1>" > index.html


EXPOSE 80