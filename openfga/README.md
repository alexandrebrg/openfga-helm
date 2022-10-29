## Parameters

### Global parameters

| Name                      | Description                                     | Value |
| ------------------------- | ----------------------------------------------- | ----- |
| `global.imageRegistry`    | Global Docker image registry                    | `""`  |
| `global.imagePullSecrets` | Global Docker registry secret names as an array | `[]`  |
| `global.storageClass`     | Global StorageClass for Persistent Volume(s)    | `""`  |


### Common parameters

| Name                | Description                                                                                               | Value           |
| ------------------- | --------------------------------------------------------------------------------------------------------- | --------------- |
| `kubeVersion`       | Force target Kubernetes version (using Helm capabilities if not set)                                      | `""`            |
| `nameOverride`      | String to partially override common.names.fullname template with a string (will prepend the release name) | `""`            |
| `fullnameOverride`  | String to fully override common.names.fullname template with a string                                     | `""`            |
| `commonAnnotations` | Annotations to add to all deployed objects                                                                | `{}`            |
| `commonLabels`      | Labels to add to all deployed objects                                                                     | `{}`            |
| `extraDeploy`       | A list of extra kubernetes resources to be deployed                                                       | `[]`            |
| `clusterDomain`     | Kubernetes cluster domain name                                                                            | `cluster.local` |


### OpenFGA parameters

| Name                                            | Description                                                                                             | Value             |
| ----------------------------------------------- | ------------------------------------------------------------------------------------------------------- | ----------------- |
| `image.registry`                                | OpenFGA image registry                                                                                  | `docker.io`       |
| `image.repository`                              | OpenFGA image repository                                                                                | `openfga/openfga` |
| `image.tag`                                     | OpenFGA image tag (immutable tags are recommended)                                                      | `v0.2.4`          |
| `image.digest`                                  | OpenFGA image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`              |
| `image.pullPolicy`                              | OpenFGA image pull policy                                                                               | `IfNotPresent`    |
| `image.pullSecrets`                             | Specify docker-registry secret names as an array                                                        | `[]`              |
| `command`                                       | Override default container command (useful when using custom images)                                    | `[]`              |
| `args`                                          | Override default container args (useful when using custom images)                                       | `[]`              |
| `containerPorts.http`                           | Port to expose at container level                                                                       | `8080`            |
| `containerPorts.grpc`                           | Port to expose at container level                                                                       | `8081`            |
| `playground.enabled`                            | Enable OpenFGA UI for playground                                                                        | `false`           |
| `playground.port`                               | Port to expose at container level                                                                       | `3000`            |
| `podAnnotations`                                | Pod annotations                                                                                         | `{}`              |
| `podSecurityContext`                            | Enabled pod Security Context                                                                            | `{}`              |
| `service.http.enabled`                          | Enable http port on service                                                                             | `true`            |
| `service.grpc.enabled`                          | Enable grpc port on service                                                                             | `true`            |
| `service.playground.enabled`                    | Enable playground port on service                                                                       | `false`           |
| `service.ports.http`                            | HTTP service port                                                                                       | `8080`            |
| `service.ports.grpc`                            | gRPC service port                                                                                       | `8081`            |
| `service.ports.playground`                      | Playground service port                                                                                 | `8082`            |
| `service.type`                                  | Kubernetes Service type                                                                                 | `ClusterIP`       |
| `service.nodePorts.http`                        | Specify the nodePort value for the LoadBalancer and NodePort service types                              | `""`              |
| `service.nodePorts.grpc`                        | Specify the nodePort value for the LoadBalancer and NodePort service types                              | `""`              |
| `service.nodePorts.playground`                  | Specify the nodePort value for the LoadBalancer and NodePort service types                              | `8082`            |
| `service.clusterIP`                             | %%MAIN_CONTAINER_NAME%% service Cluster IP                                                              | `""`              |
| `service.loadBalancerIP`                        | loadBalancerIP if Kibana service type is `LoadBalancer`                                                 | `""`              |
| `service.loadBalancerSourceRanges`              | %%MAIN_CONTAINER_NAME%% service Load Balancer sources                                                   | `[]`              |
| `service.externalTrafficPolicy`                 | Enable client source IP preservation                                                                    | `Cluster`         |
| `service.annotations`                           | Annotations for Kibana service (evaluated as a template)                                                | `{}`              |
| `service.labels`                                | Extra labels for Kibana service                                                                         | `{}`              |
| `service.extraPorts`                            | Extra ports to expose in the service (normally used with the `sidecar` value)                           | `[]`              |
| `service.sessionAffinity`                       | Session Affinity for Kubernetes service, can be "None" or "ClientIP"                                    | `None`            |
| `service.sessionAffinityConfig`                 | Additional settings for the sessionAffinity                                                             | `{}`              |
| `autoscaling.enabled`                           | Enable autoscaling                                                                                      | `false`           |
| `autoscaling.minReplicas`                       | Minimum number of OpenFGA replicas                                                                      | `1`               |
| `autoscaling.maxReplicas`                       | Maximum number of OpenFGA replicas                                                                      | `10`              |
| `autoscaling.targetCPUUtilizationPercentage`    | Target CPU utilization percentage                                                                       | `""`              |
| `autoscaling.targetMemoryUtilizationPercentage` | Target Memory utilization percentage                                                                    | `""`              |
| `readinessProbe.enabled`                        | Enable readinessProbe on OpenFGA containers                                                             | `true`            |
| `readinessProbe.initialDelaySeconds`            | Initial delay seconds for readinessProbe                                                                | `30`              |
| `readinessProbe.periodSeconds`                  | Period seconds for readinessProbe                                                                       | `10`              |
| `readinessProbe.timeoutSeconds`                 | Timeout seconds for readinessProbe                                                                      | `1`               |
| `readinessProbe.failureThreshold`               | Failure threshold for readinessProbe                                                                    | `3`               |
| `readinessProbe.successThreshold`               | Success threshold for readinessProbe                                                                    | `1`               |
| `nodeSelector`                                  | Node labels for pod assignment                                                                          | `{}`              |
| `tolerations`                                   | Tolerations for pod assignment                                                                          | `[]`              |
| `affinity`                                      | Affinity for pod assignment                                                                             | `{}`              |
| `podAffinityPreset`                             | Pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                     | `""`              |
| `podAntiAffinityPreset`                         | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                | `soft`            |
| `nodeAffinityPreset.type`                       | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard`               | `""`              |
| `nodeAffinityPreset.key`                        | Node label key to match Ignored if `affinity` is set.                                                   | `""`              |
| `nodeAffinityPreset.values`                     | Node label values to match. Ignored if `affinity` is set.                                               | `[]`              |


### OpenFGA Logging parameters

| Name             | Description                                                     | Value     |
| ---------------- | --------------------------------------------------------------- | --------- |
| `logging.format` | Alternates between the default log output format or json format | `default` |

