# Project Title

node docker app

## Deployment

To deploy this project from command line run

```bash
  docker run -v %cd%:/app -v /app/node_modules --env-file ./.env -p 3000:3000 -d --name node-app  node-docker
```

To delete the container and its associated anonymous volume from cmd

```bash
  docker rm node-app -fv
```

To enter into running container run

```bash
  docker exec -it node-app bash
```

To build the image, run

```bash
   docker build -t node-docker .
```
