# Project Title

node docker app

## Deployment

### Using TERRAFORM

Note:- Terraform CLI must be installed

1. To initial Terraform in your local machine

```bash
  terraform init
```

2. TO check the plan

```bash
  terraform plan
```

3. To apply the changes

```bash
  terraform apply --auto-approve
```

4. To remove everything

```bash
  terraform destroy --auto-approve
```

### PRODUCTION deployment using CLI in Linux server

First build the image locally

```bash
docker-compose -f docker-compose.yml -f docker-compose.prod.yml build
```

Then push the image to Docker Hub

```bash
docker-compose -f docker-compose.yml -f docker-compose.prod.yml push
```

Then in Prod env, pull the image from Docker Hub

```bash
docker-compose -f docker-compose.yml -f docker-compose.prod.yml pull
```

Then run the docker-compose

```bash
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d
```

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

## API Reference

#### To yest api

```http
  GET /api/v1/
```

#### Get all posts

```http
  GET /api/v1/posts
```

#### Get post

```http
  GET /api/v1/posts/${id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. Id of item to fetch |

#### Create New Post

```http
  POST /api/v1/posts
```

| Body    | Type     | Description   |
| :------ | :------- | :------------ |
| `title` | `string` | **Required**. |
| `Body`  | `string` | **Required**. |

#### Update Post

```http
  PATCH /api/v1/posts/${id}
```

| Body    | Type     | Description                       |
| :------ | :------- | :-------------------------------- |
| `title` | `string` | **Required**.                     |
| `Body`  | `string` | **Required**.                     |
| `id`    | `string` | **Required**. Id of item to fetch |

#### Delete Post

```http
  DELETE /api/v1/posts/${id}
```

| Body | Type | Description |
| `id` | `string` | **Required**. Id of item to delete |

#### Signup

```http
  POST /api/v1/users/signup/
```

| Body       | Type     | Description   |
| :--------- | :------- | :------------ |
| `username` | `string` | **Required**. |
| `password` | `string` | **Required**. |

#### login

```http
  POST /api/v1/users/signup/
```

| Body       | Type     | Description   |
| :--------- | :------- | :------------ |
| `username` | `string` | **Required**. |
| `password` | `string` | **Required**. |

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

## To configure Terraform

1. Install Terraform CLI from https://www.terraform.io/downloads.html
2. Extract the files in C:Program files
3. Add the path to system env variables.
4. To configure AWS download AWS CLI
5. Run this command to configure your access key and secret key

```bash
  aws configure --profile your_name
```

6. Pass in your details and you are ready to GO.
