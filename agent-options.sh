#!/bin/sh

OPTIONS=""
sep=""

if [ -n $AGENT_JAR ]; then
  OPTIONS="${OPTIONS}${sep}-javaagent:/opt/agents/${AGENT_JAR}"
  sep="="
fi

echo ${OPTIONS}
