#!/bin/sh

OPTIONS=""

if [ ! -z $AGENT_VERSION ]; then
  OPTIONS="${OPTIONS}-javaagent:/opt/agents/${AGENT_VERSION}"
fi

echo ${OPTIONS}
