#!/bin/sh

OPTIONS=""


if [ ! -z "$APPLICATIONINSIGHTS_CONNECTION_STRING" ];then
  OPTIONS="${OPTIONS}-javaagent:/opt/agents/applicationinsights-agent-${AGENT_VERSION}.jar"
fi

echo ${OPTIONS}
