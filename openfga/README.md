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

| Name                               | Description                                                                                             | Value             |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------- | ----------------- |
| `image.registry`                   | OpenFGA image registry                                                                                  | `docker.io`       |
| `image.repository`                 | OpenFGA image repository                                                                                | `openfga/openfga` |
| `image.tag`                        | OpenFGA image tag (immutable tags are recommended)                                                      | `v0.3.7`          |
| `image.digest`                     | OpenFGA image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`              |
| `image.pullPolicy`                 | OpenFGA image pull policy                                                                               | `IfNotPresent`    |
| `image.pullSecrets`                | Specify docker-registry secret names as an array                                                        | `[]`              |
| `containerPorts.http`              | Port to expose at container level                                                                       | `8080`            |
| `containerPorts.grpc`              | Port to expose at container level                                                                       | `8081`            |
| `playground.enabled`               | Enable OpenFGA UI for playground                                                                        | `false`           |
| `playground.port`                  | Port to expose at container level                                                                       | `3000`            |
| `service.http.enabled`             | Enable http port on service                                                                             | `true`            |
| `service.grpc.enabled`             | Enable grpc port on service                                                                             | `true`            |
| `service.playground.enabled`       | Enable playground port on service                                                                       | `false`           |
| `service.ports.http`               | HTTP service port                                                                                       | `8080`            |
| `service.ports.grpc`               | gRPC service port                                                                                       | `8081`            |
| `service.ports.playground`         | Playground service port                                                                                 | `8082`            |
| `service.type`                     | Kubernetes Service type                                                                                 | `ClusterIP`       |
| `service.nodePorts.http`           | Specify the nodePort value for the LoadBalancer and NodePort service types                              | `""`              |
| `service.nodePorts.grpc`           | Specify the nodePort value for the LoadBalancer and NodePort service types                              | `""`              |
| `service.nodePorts.playground`     | Specify the nodePort value for the LoadBalancer and NodePort service types                              | `8082`            |
| `service.clusterIP`                | %%MAIN_CONTAINER_NAME%% service Cluster IP                                                              | `""`              |
| `service.loadBalancerIP`           | loadBalancerIP if Kibana service type is `LoadBalancer`                                                 | `""`              |
| `service.loadBalancerSourceRanges` | %%MAIN_CONTAINER_NAME%% service Load Balancer sources                                                   | `[]`              |
| `service.externalTrafficPolicy`    | Enable client source IP preservation                                                                    | `Cluster`         |
| `service.annotations`              | Annotations for Kibana service (evaluated as a template)                                                | `{}`              |
| `service.labels`                   | Extra labels for Kibana service                                                                         | `{}`              |
| `service.extraPorts`               | Extra ports to expose in the service (normally used with the `sidecar` value)                           | `[]`              |
| `service.sessionAffinity`          | Session Affinity for Kubernetes service, can be "None" or "ClientIP"                                    | `None`            |
| `service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                             | `{}`              |


### Storage parameters

| Name                                 | Description                                                                                             | Value             |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------- | ----------------- |
| `persistencyMode`                    | Define the datastore used (default: postgres), can be "memory"                                          | `postgres`        |
| `postgresql.enabled`                 | Switch to enable or disable the PostgreSQL helm chart                                                   | `true`            |
| `postgresql.auth.username`           | Name for a custom user to create                                                                        | `openfga`         |
| `postgresql.auth.password`           | Password for the custom user to create                                                                  | `openfga`         |
| `postgresql.auth.database`           | Name for a custom database to create                                                                    | `openfga`         |
| `postgresql.architecture`            | PostgreSQL architecture (`standalone` or `replication`)                                                 | `standalone`      |
| `externalDatabase.host`              | Database host                                                                                           | `""`              |
| `externalDatabase.port`              | Database port number                                                                                    | `5432`            |
| `externalDatabase.user`              | Non-root username                                                                                       | `postgres`        |
| `externalDatabase.password`          | Password for the non-root user                                                                          | `""`              |
| `externalDatabase.database`          | Database name                                                                                           | `postgres`        |
| `externalDatabase.existingSecret`    | Name of an existing secret resource containing the database uri                                         | `""`              |
| `externalDatabase.existingSecretKey` | Name of an existing secret key containing the database uri                                              | `""`              |
| `migrateJob.image.registry`          | OpenFGA image registry                                                                                  | `docker.io`       |
| `migrateJob.image.repository`        | OpenFGA image repository                                                                                | `openfga/openfga` |
| `migrateJob.image.tag`               | OpenFGA image tag (immutable tags are recommended)                                                      | `v0.3.7`          |
| `migrateJob.image.digest`            | OpenFGA image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`              |
| `migrateJob.image.pullPolicy`        | OpenFGA image pull policy                                                                               | `IfNotPresent`    |
| `migrateJob.annotations`             | Annotations for migration job                                                                           | `{}`              |
| `migrateJob.podAnnotations`          | Annotations for pod created by migration job                                                            | `{}`              |
| `migrateJob.podTolerations`          | Tolerations for job pod assignment                                                                      | `[]`              |
| `migrateJob.initContainers`          | Add additional init containers to migration job                                                         | `[]`              |
| `migrateJob.command`                 | Change the command executed at run of migration job container                                           | `[]`              |
| `migrateJob.args`                    | Change arguments executed at run of migration job container                                             | `[]`              |
| `migrateJob.backoffLimit`            | Number of backoff before migration job is considered as failed                                          | `1`               |
| `migrateJob.ttlSecondsAfterFinished` | Time in seconds for time to live of the job                                                             | `60`              |
| `migrateJob.resources.limits`        | Resources limits for migration pod                                                                      | `{}`              |
| `migrateJob.resources.requests`      | Resources requested for migration pod                                                                   | `{}`              |


### Deployment parameters

| Name                                 | Description                                                          | Value  |
| ------------------------------------ | -------------------------------------------------------------------- | ------ |
| `command`                            | Override default container command (useful when using custom images) | `[]`   |
| `args`                               | Override default container args (useful when using custom images)    | `[]`   |
| `podAnnotations`                     | Pod annotations                                                      | `{}`   |
| `podSecurityContext`                 | Enabled pod Security Context                                         | `{}`   |
| `readinessProbe.enabled`             | Enable readinessProbe on OpenFGA containers                          | `true` |
| `readinessProbe.initialDelaySeconds` | Initial delay seconds for readinessProbe                             | `30`   |
| `readinessProbe.periodSeconds`       | Period seconds for readinessProbe                                    | `10`   |
| `readinessProbe.timeoutSeconds`      | Timeout seconds for readinessProbe                                   | `1`    |
| `readinessProbe.failureThreshold`    | Failure threshold for readinessProbe                                 | `3`    |
| `readinessProbe.successThreshold`    | Success threshold for readinessProbe                                 | `1`    |
| `extraEnvVars`                       | Extra environment variables to be set on OpenFGA container           | `[]`   |
| `extraEnvVarsCM`                     | Name of existing ConfigMap containing extra env vars                 | `""`   |
| `extraEnvVarsSecret`                 | Name of existing Secret containing extra env vars                    | `""`   |


### OpenFGA Logging parameters

| Name             | Description                                                     | Value     |
| ---------------- | --------------------------------------------------------------- | --------- |
| `logging.format` | Alternates between the default log output format or json format | `default` |


### Security parameters

| Name                                            | Description                                                                               | Value   |
| ----------------------------------------------- | ----------------------------------------------------------------------------------------- | ------- |
| `serviceAccount.create`                         | Enable the creation of a ServiceAccount for OpenFGA pods                                  | `true`  |
| `serviceAccount.name`                           | Name of the created ServiceAccount                                                        | `""`    |
| `serviceAccount.automountServiceAccountToken`   | Auto-mount the service account token in the pod                                           | `true`  |
| `serviceAccount.annotations`                    | Additional custom annotations for the ServiceAccount                                      | `{}`    |
| `autoscaling.enabled`                           | Enable autoscaling                                                                        | `false` |
| `autoscaling.minReplicas`                       | Minimum number of OpenFGA replicas                                                        | `1`     |
| `autoscaling.maxReplicas`                       | Maximum number of OpenFGA replicas                                                        | `10`    |
| `autoscaling.targetCPUUtilizationPercentage`    | Target CPU utilization percentage                                                         | `""`    |
| `autoscaling.targetMemoryUtilizationPercentage` | Target Memory utilization percentage                                                      | `""`    |
| `nodeSelector`                                  | Node labels for pod assignment                                                            | `{}`    |
| `tolerations`                                   | Tolerations for pod assignment                                                            | `[]`    |
| `affinity`                                      | Affinity for pod assignment                                                               | `{}`    |
| `podAffinityPreset`                             | Pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`       | `""`    |
| `podAntiAffinityPreset`                         | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`  | `soft`  |
| `nodeAffinityPreset.type`                       | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard` | `""`    |
| `nodeAffinityPreset.key`                        | Node label key to match Ignored if `affinity` is set.                                     | `""`    |
| `nodeAffinityPreset.values`                     | Node label values to match. Ignored if `affinity` is set.                                 | `[]`    |

