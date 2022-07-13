FROM bhgedigital/envsubst:v1.0-alpine3.6 as builder

ARG BUILD_ID

WORKDIR /app
COPY ./src ./src
RUN mkdir ./build &&\
    envsubst < ./src/index.html > ./build/index.html

FROM nginx:1.21.6
COPY --from=builder ./app/build /usr/share/nginx/html