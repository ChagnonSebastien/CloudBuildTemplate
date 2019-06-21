local utils = import 'utils.libsonnet';
local values = import 'values.libsonnet';
{
  steps: [
    utils.SimpleBuildStep('gcr.io/cloud-builders/mvn', [ 'clean', 'install' ])
  ] + (
    if std.startsWith(std.extVar("branch"), "release") || std.extVar("branch") == "master" || std.extVar("branch") == "develop" then [
	  utils.SimpleBuildStep('gcr.io/cloud-builders/docker', [ 'build', '-t', 'gcr.io/$PROJECT_ID/' + utils.environment + '/' + values.component_name, '.' ]),
	  utils.ScriptedBuildStep('./build-scripts/version.bash'),
	  utils.ScriptedBuildStep('./build-scripts/docker-tag-versions.bash', 'gcr.io/cloud-builders/docker', [
	    'PROJECT_ID=$PROJECT_ID',
		'APP_NAME=' + values.component_name,
		'BUILD_ID=$BUILD_ID',
		'BUILD_ENVIRONEMENT=' + utils.environment
      ]),
    ] else []
  ),
  images: ['gcr.io/$PROJECT_ID/' + utils.environment + '/' + values.component_name]
}
