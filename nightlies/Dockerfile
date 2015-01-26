FROM dockerfile/ubuntu

MAINTAINER Christian Groll

# Add the Julia PPA
RUN apt-get install -y -o DPkg::Options::=--force-confold apt-utils software-properties-common \
    && apt-add-repository -y ppa:staticfloat/julianightlies \
    && add-apt-repository -y ppa:staticfloat/julia-deps \
    && apt-get update \
    && apt-get install -y julia \
    && apt-get clean

RUN mkdir /home/chris/
ENV HOME /home/chris/
ENV USER chris

Add ./setup_julia_and_r.sh /tmp/
RUN /bin/bash /tmp/setup_julia_and_r.sh

WORKDIR /home/chris/

