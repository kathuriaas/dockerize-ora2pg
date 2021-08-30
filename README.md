# dockerize-ora2pg

This repo has docker-compose file for ora2pg docker image/container.

Follow below steps to setup docker:-

1. Clone this repo.
2. `cd` to the directory, as you need.
3. Run `docker-compose build` to build the images as per `docker-compose.yml` file of the directory. If there is no build tag in YAML/YML file, use `docker-compose pull`.
4. Run `docker-compose up -d` to create and start all containers in detached mode.

Follow below steps to connect to container:-

1. `ora2pg` is the container name. Replace it in next step.
2. `docker exec -it <container ID/name> bash`

## Pull image from docker hub

This docker image is also available on docker hub and can be pulled using below steps:-

1. Run `docker pull kathuriaas/dockerize-ora2pg`
2. Now, start container in background with interactive mode using command `docker run -itd --name ora2pg_container kathuriaas/dockerize-ora2pg`
3. Connect to container using command `docker exec -it ora2pg_container bash`
4. Now, container is ready to use for ora2pg