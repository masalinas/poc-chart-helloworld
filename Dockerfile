FROM nginx:alpine

LABEL author="Miguel Salinas Gancedo"
LABEL description="HelloWorld Microservice"

COPY index.html /usr/share/nginx/html/index.html
