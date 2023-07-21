# How to Replicate

## Pre-requisite

- [Install Helm](https://helm.sh/docs/intro/install/)

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

- Install `jq`

```bash
sudo apt install jq
```

- Install `python3`

```bash
sudo apt-get update
sudo apt-get install python3
```

## Steps

> **Note**:
> Change the URL for each page inside the `script/repo/pull-charts.sh` according to your Link.

```bash
# no initial helm repo should be present
helm ls


# aether
chmod +x scripts/aether/pull-charts.sh
./scripts/aether/pull-charts.sh

python3 scripts/aether/create-readme.py


# atomix
chmod +x scripts/atomix/pull-charts.sh
./scripts/atomix/pull-charts.sh

python3 scripts/atomix/create-readme.py


# incubator
chmod +x scripts/incubator/pull-charts.sh
./scripts/incubator/pull-charts.sh

python3 scripts/incubator/create-readme.py


# onos
chmod +x scripts/onosproject/pull-charts.sh
./scripts/onosproject/pull-charts.sh

python3 scripts/onosproject/create-readme.py


# opencord
chmod +x scripts/opencord/pull-charts.sh
./scripts/opencord/pull-charts.sh

python3 scripts/opencord/create-readme.py


# rancher
chmod +x scripts/rancher/pull-charts.sh
./scripts/rancher/pull-charts.sh

python3 scripts/rancher/create-readme.py
```
