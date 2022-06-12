## Deploy using Docker Hub and Charmuseum

Login in Docker hub
- docker login

Build and tag for Docker Hub
- docker build -t ofertoio/helloworld-chart:1.55.0 .

Publish docker image in Docker Hub
- docker push ofertoio/helloworld-chart:1.55.0

Package Chart
- helm package helm-chart --version 1.55.0

Publish chart in Chartmuseum
- curl --data-binary "@helloworld-chart-1.55.0.tgz" http://localhost:8088/api/charts