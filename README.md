# MyFirstDockerApp
Very first app using Docker

## Build container
Let's create a container, called `julienpascal/docker-app`, with our Julia application.
Don't hesitate to adjust the name of your container.
```bash
docker build ~/Documents/REPOSITORIES/MyFirstDockerApp/julia-app -t julienpascal/docker-app
```

## Run container
Let's run our freshly created container
```bash
docker run --name julia-app julienpascal/docker-app
```

## Delete containers and images
```bash
docker ps -a -q
docker container stop <container ID>
docker images
docker image rm <image ID>
```

### To remove all stopped containers
```bash
docker container prune
```

### Sync with DockerHub
Once you are happy with your container, you can make it available online
by publishing it on DockerHub:
* Go on DockerHub and create a repository called `<your Docker name>/<container name>`
(in my case, `julienpascal/docker-app`)
* Login and push your container to your repository:
```
docker login
docker push julienpascal/docker-app
```

Your application is now available to the world via
```
docker pull julienpascal/docker-app
```

We can test our container by first deleting the local version 
and then pulling the version we just uploaded:
```bash
docker image rm julienpascal/docker-app
docker pull julienpascal/docker-app
docker run --name julia-app julienpascal/docker-app
```

