{
  SimpleBuildStep(name, args=[]):: {
    name: name,
    args: args
  },
  BuildStep(name, args, env=[]):: {
    name: name,
    args: args,
    env: env
  },
  ScriptedBuildStep(script, name='ubuntu', env=[], entrypoint='/bin/bash'):: {
    name: name,
    args: script,
    env: env,
    entrypoint: entrypoint
  },
  environment: if std.startsWith(std.extVar("branch"), "release") || std.extVar("branch") == "develop" then "staging" else (
    if std.extVar("branch") == "master" then "production" else "development"
  )
}
