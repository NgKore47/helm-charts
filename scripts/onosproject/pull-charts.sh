#!/bin/bash

# Create the directory if it doesn't exist
mkdir -p charts.onosproject.ngkore.org

# Update the repo to make sure we have the latest list of charts
helm repo add onos https://charts.onosproject.org/
helm repo update onos

# Get the list of all chart names in the onos repo
chart_names=$(helm search repo onos -l --output json | jq -r '.[].name')

# Get the list of all chart versions in the onos repo
chart_versions=$(helm search repo onos -l --output json | jq -r '.[].version')

# Convert the chart names and versions to arrays
chart_names=($chart_names)
chart_versions=($chart_versions)

# Log file to capture errors
error_log="error/error_log_onos.txt"

# Loop through the list of charts and download each one
for ((i=0; i<${#chart_names[@]}; i++)); do
  chart_name=${chart_names[i]}
  chart_version=${chart_versions[i]}
  echo "Pulling chart: $chart_name version: $chart_version"
  # Redirect stderr to the error log file
  helm pull $chart_name --version $chart_version -d charts.onosproject.ngkore.org 2>>$error_log
done

# Check if there were any errors
if [ -s $error_log ]; then
  echo "Errors occurred during chart downloads. Check the $error_log file for details."
else
  echo "All charts downloaded successfully! Number of charts downloaded in the charts.onosproject.ngkore.org repository: $(ls charts.onosproject.ngkore.org | wc -l)"
fi