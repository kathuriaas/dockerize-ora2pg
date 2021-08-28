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