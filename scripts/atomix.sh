#!/bin/bash

# Create the directory if it doesn't exist
mkdir -p charts.atomix.ngkore.org

# Update the repo to make sure we have the latest list of charts
helm repo update atomix

# Get the list of all chart names in the atomix repo
chart_names=$(helm search repo atomix -l --output json | jq -r '.[].name')

# Get the list of all chart versions in the atomix repo
chart_versions=$(helm search repo atomix -l --output json | jq -r '.[].version')

# Convert the chart names and versions to arrays
chart_names=($chart_names)
chart_versions=($chart_versions)

# Loop through the list of charts and download each one
for ((i=0; i<${#chart_names[@]}; i++)); do
  chart_name=${chart_names[i]}
  chart_version=${chart_versions[i]}
  echo "Pulling chart: $chart_name version: $chart_version"
  helm pull $chart_name --version $chart_version -d charts.atomix.ngkore.org
done
