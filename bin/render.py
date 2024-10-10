#!/usr/bin/env python3
import jinja2
import sys
import yaml

if len(sys.argv) != 2:
    print("I need a template file...")
    sys.exit(1)

TEMPLATE_FILE = sys.argv[1]


COMPONENT_CONFIG = {
    "id": "streaming-static",
    "product": "blabla",
    "service_name": "something",
    "ecosystems": {"dev": ["sit"]},
    "data": {
        "main_config": {
            "gha_build": "true",
            "branch": "main",
            "gitRepo": "my-repo",
            "s3_content_suffix": "content",
            "s3_artifacts_suffix": "artifact",
        },
    },
}


templateLoader = jinja2.FileSystemLoader(searchpath="./")
templateEnv = jinja2.Environment(loader=templateLoader)
template = templateEnv.get_template(TEMPLATE_FILE)
outputText = template.render(
    COMPONENT_CONFIG=COMPONENT_CONFIG
)  # this is where to put args to the template renderer

print(outputText)
print()

# print(yaml.dump(COMPONENT_CONFIG, indent=2))
