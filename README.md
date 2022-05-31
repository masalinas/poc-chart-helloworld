## Description

PoC Helloworld Helm Package deployed in minikube

## Deployment steps: helm chart

- **STEP01**: Start minikube cluster
```shell
minikube start
```

- **STEP02**: Activate dashboard addon in minikube
```shell
minikube addons enable dashboard
```

- **STEP03**: Run Dashboard addon
```shell
minikube dashboard
```
[Minikube Dashboard Link](http://127.0.0.1:39221/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/service?namespace=default)

- **STEP04**: Build docker image
```shell
docker build -t helloworld-chart .
```

- **STEP05**: tag the docker image to be published under your Docker Hub account
```shell
docker tag helloworld-chart ofertoio/helloworld-chart
```

- **STEP06**: login in your Docker Hub account
```shell
docker login -u ofertopio -p
```

- **STEP07**: Push docker image to your Docker Hug account
```shell
docker push ofertoio/helloworld-chart
```

- **STEP08**: Package your helm chart
```shell
helm package helm-chart
```

To create a new helm chart package execute and set **image** and **service** chart attributes from values.yaml
```shell
helm create helm
```

- **STEP09**: deploy helm chart release in minikube
```shell
helm install helloworld-chart helloworld-chart-0.1.0.tgz
```

![kubernetes Dashboard](captures/kubernetes_dashboard.png "kubernetes Dashboard")

- **STEP10**: Activate tunelling to expose kubernetes service
```shell
sudo minikube tunnel
```

- **STEP11**: [install nova CLI](https://nova.docs.fairwinds.com/installation/#installation) to check chart versions
```shell
curl -L "https://github.com/FairwindsOps/nova/releases/download/1.0.0/nova_1.0.0_linux_amd64.tar.gz" > nova.tar.gz
tar -xvf nova.tar.gz
sudo mv nova /usr/local/bin/
```

- **STEP12**: list helm relases installed
```shell
nova find
```

- **STEP13**: remove helm chart release from minikube
```shell
helm delete helloworld-chart
```

## Deployment steps: kubernetes deployment

- **STEP01**: a simple sample to be deployed on minikube like deployment
```shell
kubectl create deployment hello-minikube --image=polyverse/node-echo-server
```

```shell
kubectl expose deployment hello-minikube --type=NodePort --port=8080
```

```shell
kubectl port-forward service/hello-minikube 7080:8080

http://localhost:7080/Hello
```

## Deployment steps: chartmuseum

- **STEP01**: install chartmuseum chart repository

create a folder called charts to save your charts pushed

```shell
docker run --rm -it \
  -p 8088:8080 \
  -e DEBUG=1 \
  -e STORAGE=local \
  -e STORAGE_LOCAL_ROOTDIR=/charts \
  -v $(pwd)/charts:/charts \
  ghcr.io/helm/chartmuseum:v0.14.0
```

- **STEP02**: publish your chart

```shell
curl --data-binary "@helloworld-chart-0.1.0.tgz" http://localhost:8088/api/charts
```

- **STEP03**: we could published the chart using a chartmuseum helm plugin called push

```shell
helm plugin install https://github.com/chartmuseum/helm-push
```

then push the chart using the plugin
```shell
helm push helloworld-chart chartmuseum
```

- **STEP04**: list charts published in chartmuseum

```shell
helm repo add chartmuseum http://localhost:8088

helm search repo chartmuseum
```
