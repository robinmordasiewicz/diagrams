FROM ubuntu:latest

ENV TZ="America/Toronto"
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get --yes update \
    && apt-get --yes upgrade \
    && apt-get -y install apt-utils \
    && apt-get -y install graphviz python3-pip software-properties-common python3

COPY VERSION /VERSION
RUN echo "diagrams-`cat /VERSION`" >> /VERSION.tmp
RUN mv /VERSION.tmp /VERSION
WORKDIR /home/ubuntu
RUN pip install diagrams

RUN groupadd -g 1000 ubuntu
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g 1000 -G sudo -u 1000 ubuntu
RUN touch /home/ubuntu/.sudo_as_admin_successful
RUN touch /home/ubuntu/.hushlogin
RUN chown -R ubuntu:ubuntu /home/ubuntu
USER ubuntu:ubuntu
