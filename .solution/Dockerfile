FROM python:3.10 AS build

## Prepare data for build
WORKDIR /data
COPY src /data/src
COPY test /data/test
COPY run /data/run
COPY requirements.dev /data/requirements.dev
COPY requirements.prod /data/requirements.prod
COPY Jenkinsfile /data/Jenkinsfile

## Install development dependencies and run all tests
RUN python3 -m pip install --upgrade --no-cache-dir -r /data/requirements.dev
RUN grep -Po "sh '\Krun/test-.+(?=')" /data/Jenkinsfile |sh -x

## Create self-contained artifact
RUN python3 -m pip install --upgrade --no-cache-dir -r /data/requirements.prod --target /data/src
RUN rm -fr /data/src/*.dist-info
RUN python3 -m zipapp --python="/usr/bin/env python3" --output=/data/game.pyz /data/src

## Create production image with artifact from build
FROM python:3.10
COPY --from=build /data/game.pyz /game.pyz
CMD ./game.pyz
