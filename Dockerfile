FROM ubuntu:latest

ENV TZ="America/Toronto"
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get --yes update \
    && apt-get --yes upgrade \
    && apt -y install apt-utils \
    && apt -y install graphviz

RUN groupadd -g 1000 ubuntu
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g 1000 -G sudo -u 1000 ubuntu
RUN touch /home/ubuntu/.sudo_as_admin_successful
RUN touch /home/ubuntu/.hushlogin
RUN chown -R ubuntu:ubuntu /home/ubuntu
USER ubuntu:ubuntu
