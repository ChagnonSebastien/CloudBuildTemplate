# CloudBuild Template
This project uses jsonnet to build a dynamic cloudbuild configuration for multiple environments.

## Before using
 - Modify the values according to your project in the config file `values.libsonnet`
 - Make sure jsonlib is in your PATH

## Run
`jsonnet --ext-str branch={{actual_branch}} build_template.jsonnet -o cloudbuild.json`
