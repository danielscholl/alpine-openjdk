## Alpine Java Base Image

![Docker Build and Push](https://github.com/danielscholl/alpine-openjdk/workflows/Docker%20Build%20and%20Push/badge.svg)

This is a repository for Java Docker base images used in osdu projects.


A controlled Alpine docker image with openjdk and application insights agent.

Build
------

The make script will build the docker image. Arguments can be passed to the script that define the Terraform and Azure CLI Versions.

- Argument 1:  JDK_VERSION
- Argument 2:  AGENT_VERSION

Default Versions

- JDK_VERSION=8.252.09-r0
- AGENT_VERSION=3.0.2

__COMMAND__
```
$ make \
    STEP_1_IMAGE="alpine:3.12" \
    JDK_VERSION=8.252.09-r0 \
    AGENT_VERSION=3.0.2 \
    docker-build
```
