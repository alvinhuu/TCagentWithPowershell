FROM jetbrains/teamcity-agent:latest
USER root

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
      apt-get -y install sudo

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

CMD /bin/bash

RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

RUN apt-add-repository https://packages.microsoft.com/ubuntu/20.04/prod

RUN apt-get update

RUN ACCEPT_EULA=Y apt-get install -y powershell
