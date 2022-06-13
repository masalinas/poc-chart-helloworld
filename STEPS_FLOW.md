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

## Deploy using JFrog Artifactory

Login in JFrog Artifactory
- docker login https://oferto.jfrog.io

Build and tag for JFrog Artifactory
- docker build -t oferto.jfrog.io/training-docker-local/helloworld-chart:1.57.0 .

Publish docker image in JFrog Artifactory
- docker push oferto.jfrog.io/training-docker-local/helloworld-chart:1.57.0

Package Chart
- helm package helm-chart --version 1.57.0

Publish chart in JFrog Artifactory
- curl -u masalinas.gancedo@oferto.io:cmVmdGtuOjAxOjE2ODY1OTEwOTE6OWU0STdicW9mbWs0VmZGb0QxSTlWSVVDUEo4 -T ./helloworld-chart-1.57.0.tgz "https://oferto.jfrog.io/artifactory/training-helm-local/helloworld-chart-1.57.0.tgz"
