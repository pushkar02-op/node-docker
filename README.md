# Project Title

node docker app

## Deployment

## CLI Commands

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

### CLI commands for docker compose using different files for Dev and Prod

To deploy the dev using docker compose

```bash
  docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d
```

To down the dev env

```bash
  docker-compose -f docker-compose.yml -f docker-compose.dev.yml down 
```

To deploy the prod using docker compose

```bash
  docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d
```

To down the prod env

```bash
  docker-compose -f docker-compose.yml -f docker-compose.prod.yml down 
```

To show changes in prov env

```bash
  docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d --build
```

### Mongo service

To directly login in mongo container

```bash
  docker exec -it node-docker_mongo_1 mongo -u "username" -p "password"
```
