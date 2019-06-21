# CloudBuild Template
This project uses jsonnet to build a dynamic cloudbuild configuration for multiple environments.

## Run
`jsonnet --ext-str branch={{actual_branch}} build_template.jsonnet -o cloudbuild.json`
