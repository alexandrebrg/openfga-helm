# OpenFGA Helm chart 

![Helm chart version](https://img.shields.io/github/v/release/AlexandreBrg/openfga-helm?sort=semver&color=green)

**Be aware that this chart isn't the official OpenFGA chart!**

OpenFGA is an high-performance and flexible authorization/permission engine built for developers and inspired by [Google Zanzibar](https://research.google/pubs/pub48190/). 
You can learn more about it on their [official repository](https://github.com/openfga/openfga/).

## TL;DR

```
helm repo add openfga https://alexandrebrg.github.io/openfga-helm
helm install openfga openfga/openfga
```

*Default settings will create a PostgreSQL server along with OpenFGA.*

## Quick start

*Requirements*:

- Helm
- [Docker](https://docs.docker.com/engine/install/)
- [K3d](https://k3d.io/)

Run the following commands:

```shell
# Creates a single node cluster to run on
k3d cluster create openfga

# Install the helm chart on the cluster
helm repo add openfga https://alexandrebrg.github.io/openfga-helm
helm install openfga openfga/openfga --set playground.enabled="true" --set service.playground.enabled="true"

## Wait until your openfga pod is healthy & ready to server!

# Port-forward into the service
kubectl port-forward --namespace default svc/openfga 8082:8082 &

## You can now open in your browser the following URL to access playground:
## http://localhost:8082/playground

## When you are done, you can now delete your cluster
k3d cluster delete openfga
```

## Contributing

It's a community helm chart. I invite everyone to join the party and help the chart
to go forward ❤️! You can peruse the [contributing guidelines](./CONTRIBUTING.md)