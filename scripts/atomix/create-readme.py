import yaml

# Read the YAML content from the file
with open("charts.atomix.ngkore.org/index.yaml") as f:
    data = yaml.safe_load(f)

# Initialize an empty list to store the chart details
chart_details = []

# Loop through the entries and extract the required information
for chart_name, chart_versions in data["entries"].items():
    for chart in chart_versions:
        name = chart["name"]
        version = chart["version"]
        urls = chart["urls"]
        download_url = urls[0] if urls else ""

        # Append the chart details to the list
        chart_details.append(f"| {name} | {version} | [Download]({download_url}) |")

# Add the header to the chart details list
Heading = "ATOMIX"
header1 = f"# {Heading} HELM CHARTS"
header2 = "| NAME | CHART VERSION | Link |"
header3 = "| -- | -- | -- |"
chart_details.insert(0, header1)
chart_details.insert(1, header2)
chart_details.insert(2, header3)

# Write the chart details to a separate file
with open("charts.atomix.ngkore.org/README.md", "w") as f:
    for chart in chart_details:
        f.write(chart + "\n")
