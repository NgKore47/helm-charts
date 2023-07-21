#!/bin/bash

# Create the directory if it doesn't exist
mkdir -p charts.aetherproject.ngkore.org

# Update the repo to make sure we have the latest list of charts
helm repo add aether https://charts.aetherproject.org/
helm repo update aether

# Get the list of all chart names in the aether repo
chart_names=$(helm search repo aether -l --output json | jq -r '.[].name')

# Get the list of all chart versions in the aether repo
chart_versions=$(helm search repo aether -l --output json | jq -r '.[].version')

# Convert the chart names and versions to arrays
chart_names=($chart_names)
chart_versions=($chart_versions)

# Log file to capture errors
error_log="error/error_log_aether.txt"

# Loop through the list of charts and download each one
for ((i=0; i<${#chart_names[@]}; i++)); do
  chart_name=${chart_names[i]}
  chart_version=${chart_versions[i]}
  echo "Pulling chart: $chart_name version: $chart_version"
  # Redirect stderr to the error log file
  helm pull $chart_name --version $chart_version -d charts.aetherproject.ngkore.org 2>>$error_log
done

# Check if there were any errors
if [ -s $error_log ]; then
  echo "Errors occurred during chart downloads. Check the $error_log file for details."
else
  num_downloaded=$(ls charts.aetherproject.ngkore.org | wc -l)
  num_available=$(helm search repo aether -l | wc -l | awk '{print $1-1}')
  echo "All charts downloaded successfully! Number of charts downloaded in the charts.aetherproject.ngkore.org directory: $num_downloaded"

  if [ $num_downloaded -ne $num_available ]; then
    echo "Number of charts in the directory and the official Helm repo do not match."
  else
    echo "Number of charts in the directory and the official Helm repo match."
  fi
fi

helm repo remove aether

URL = "https://ngkore47.github.io/helm-charts/charts.aetherproject.ngkore.org/"
cd charts.aetherproject.ngkore.org/
helm repo index . --url $URL
cd ..