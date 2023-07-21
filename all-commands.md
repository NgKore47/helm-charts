```bash

helm ls

#incubator

helm search repo incubator -l
helm search repo incubator -l | wc -l | awk '{print $1-1}'

sudo apt install jq

chmod +x scripts/incubator.sh
./scripts/incubator.sh

ls charts.incubator.ngkore.org | wc -l

#opencord

helm search repo cord -l
helm search repo cord -l | wc -l | awk '{print $1-1}'

chmod +x scripts/cord.sh
./scripts/cord.sh

ls charts.opencord.ngkore.org | wc -l

#atomix
helm repo add atomix https://charts.atomix.io/

helm search repo atomix -l
helm search repo atomix -l | wc -l | awk '{print $1-1}'

chmod +x scripts/atomix.sh
./scripts/atomix.sh

ls charts.atomix.ngkore.org | wc -l

#onosproject

helm search repo onos -l
helm search repo onos -l | wc -l | awk '{print $1-1}'

chmod +x scripts/onos.sh
./scripts/onos.sh

ls charts.onosproject.ngkore.org | wc -l

#aetherproject
helm repo add aether https://charts.aetherproject.org/

helm search repo aether -l
helm search repo aether -l | wc -l | awk '{print $1-1}'

chmod +x scripts/aether.sh
./scripts/aether.sh

ls charts.aetherproject.ngkore.org | wc -l

#rancher

helm search repo rancher -l
helm search repo rancher -l | wc -l | awk '{print $1-1}'

chmod +x scripts/rancher.sh
./scripts/rancher.sh

ls charts.rancher.ngkore.org | wc -l

```

```bash
cd charts.atomix.ngkore.org
helm repo index . --url https://ngkore47.github.io/helm-charts/charts.atomix.ngkore.org/
helm search repo atomix -l | awk 'BEGIN {FS="\t"} {print $1 "\t" $2 "\t" $3}' > README.md
cd ..


cd charts.incubator.ngkore.org
helm repo index . --url https://ngkore47.github.io/helm-charts/charts.incubator.ngkore.org/
helm search repo incubator -l | awk 'BEGIN {FS="\t"} {print $1 "\t" $2 "\t" $3}' > README.md
cd ..


cd charts.opencord.ngkore.org
helm repo index . --url https://ngkore47.github.io/helm-charts/charts.opencord.ngkore.org/
helm search repo cord -l | awk 'BEGIN {FS="\t"} {print $1 "\t" $2 "\t" $3}' > README.md
cd ..


cd charts.onosproject.ngkore.org
helm repo index . --url https://ngkore47.github.io/helm-charts/charts.onosproject.ngkore.org/
helm search repo onos -l | awk 'BEGIN {FS="\t"} {print $1 "\t" $2 "\t" $3}' > README.md
cd ..


cd charts.aetherproject.ngkore.org
helm repo index . --url https://ngkore47.github.io/helm-charts/charts.aetherproject.ngkore.org/
helm search repo aether -l | awk 'BEGIN {FS="\t"} {print $1 "\t" $2 "\t" $3}' > README.md
cd ..


cd charts.rancher.ngkore.org
helm repo index . --url https://ngkore47.github.io/helm-charts/charts.rancher.ngkore.org/
helm search repo rancher -l | awk 'BEGIN {FS="\t"} {print $1 "\t" $2 "\t" $3}' > README.md
cd ..
```
