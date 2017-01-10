# Docker image containing libpostal and pelias api

## Build the image

`docker build . -t pelias-api-libpostal --build-arg PROXY=<proxy>`

## Run the container

`docker run -p 3100:3100 -p 9200:9200 pelias-api-libpostal`
