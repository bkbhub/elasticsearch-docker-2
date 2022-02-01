#! /bin/sh

docker buildx build --load --platform=linux/amd64 -t bkbhub/elasticsearch-2.4:amd64 .
docker buildx build --load --platform=linux/arm64 -t bkbhub/elasticsearch-2.4:arm64 .

docker push bkbhub/elasticsearch-2.4:amd64
docker push bkbhub/elasticsearch-2.4:arm64

docker manifest rm bkbhub/elasticsearch-2.4:latest

docker manifest create --amend bkbhub/elasticsearch-2.4:latest bkbhub/elasticsearch-2.4:amd64 bkbhub/elasticsearch-2.4:arm64

docker manifest push bkbhub/elasticsearch-2.4:latest
