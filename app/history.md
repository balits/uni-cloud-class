# Day 1
* Dockerfile:
```dockerfile
FROM golang:1.22.0-bullseye

WORKDIR /app

COPY . .

RUN go mod download

RUN go build -o /out
EXPOSE 8080

CMD [ "/out"]
```
 
* docker image ls -a
* docker build --rm -t <image-name>:<version>  .
* docker kill <id>
* docker run --rm -d -p 8080:8080 --name <container-name> <image-name>:<version>
  * --rm:   Megöli a konténert, miután az leáll
  * -d:     Detached módban, azaz a háttérben fut (és nem veszi el a terminálomat :3)
  * -p:     Portforwaring (hostport:containerport)
  * --name: A konténer megnevezése
* docker exec -it <container-name> bash
* docker stop <container-name> (Ha a docker run-nál --rm-et is használtunk, eltűnik a container)
