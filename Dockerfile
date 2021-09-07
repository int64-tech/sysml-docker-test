# Basic jupyterlab/sysmlv2 dockerfile starting with Ubuntu 18.04
# Change to trigger test build of docker file - JKD
# 9/1/21a
FROM ubuntu:18.04
ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"
RUN apt-get update

RUN apt-get install -y git wget && rm -rf /var/lib/apt/lists/*

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 
RUN conda --version

# install OpenJDK 11
RUN apt-get install openjdk-11-jdk-headless
RUN java -version

# install sysmlv2
RUN git clone https://github.com/Systems-Modeling/SysML-v2-Release.git
