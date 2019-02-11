# Grafana Loki

## Introduction

[Loki](https://github.com/grafana/loki) is a horizontally-scalable, highly-available, multi-tenant log aggregation system inspired by Prometheus.
It is designed to be very cost effective and easy to operate.
It does not index the contents of the logs, but rather a set of labels for each log stream.

As Loki is in a very early development state consider this chart also as not production ready but good enough to play around with Loki.

## Installing the Chart

Install from remote URL with the release name `grafana-loki` into namespace `infra`:

```console
$ helm upgrade --install grafana-loki kiwigrid/grafana-loki
```

## Uninstalling the Chart

To uninstall/delete the `grafana-loki` deployment:

```console
$ helm delete grafana-loki --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the GCP serviceaccount chart and their default values.

| Parameter             | Description            | Default                 |
| --------------------- | ---------------------- | ----------------------- |
| `image`               | Grafana loki image     | `kiwigrid/grafana-loki` |
| `imageTag`            | Grafana loki image tag | `master-95c407e`        |
| `imagePullPolicy`     | Image pull policy      | `IfNotPresent`          |
| `replicaCount`        | replicaCount           | `1`                     |
| `nameOverride`        | nameOverride           | `""`                    |
| `fullnameOverride`    | fullnameOverride       | `""`                    |
| `service.type`        | service type           | `ClusterIP`             |
| `service.port`        | service port           | `80`                    |
| `ingress.enabled`     | ingress enabled        | `false`                 |
| `ingress.annotations` | ingress annotations    | `{}`                    |
| `ingress.path`        | ingress path           | `/`                     |
| `ingress.hosts`       | ingress host           | `chart-example.local`   |
| `ingress.tls`         | ingress tls            | `[]`                    |
| `resources`           | resources              | `{}`                    |
| `nodeSelector`        | node Selector          | `{}`                    |
| `tolerations`         | tolerations            | `[]`                    |
| `affinity`            | affinity               | `{}`                    |
