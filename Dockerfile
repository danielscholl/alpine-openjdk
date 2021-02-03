ARG STEP_1_IMAGE=alpine:3.12
ARG IMAGE_TAG=0.0.0

FROM ${STEP_1_IMAGE}

ARG JDK_VERSION=8.252.09-r0
ARG AGENT_VERSION=3.0.2

LABEL Name="danielscholl/alpine-openjdk" \
  Version=${IMAGE_TAG}

USER root

RUN mkdir -p /deployments

# JAVA_APP_DIR is used by run-java.sh for finding the binaries
ENV JAVA_APP_DIR=/deployments \
  JAVA_MAJOR_VERSION=8 \
  AGENT_VERSION=${AGENT_VERSION} \
  APPLICATIONINSIGHTS_CONNECTION_STRING=""

RUN apk add --update \
  curl \
  openjdk8=${JDK_VERSION} \
  && rm /var/cache/apk/* \
  && echo "securerandom.source=file:/dev/urandom" >> /usr/lib/jvm/default-jvm/jre/lib/security/java.security

# Application Insights Agent
RUN mkdir -p /opt/agents \
  && chmod g+rwx /opt/agents \
  && curl -i -k -L https://github.com/microsoft/ApplicationInsights-Java/releases/download/${AGENT_VERSION}/applicationinsights-agent-${AGENT_VERSION}.jar -o /opt/agents/applicationinsights-agent-${AGENT_VERSION}.jar \
  && chmod 444 /opt/agents/applicationinsights-agent-${AGENT_VERSION}.jar

ADD run-env.sh /opt/run-env.sh
ADD agent-options.sh /opt/run-java-options


# Add run script as /deployments/run-java.sh and make it executable
COPY run-java.sh /deployments/
RUN chmod 755 /deployments/run-java.sh

CMD [ "/deployments/run-java.sh" ]
