FROM juliacomputing/juliapro

MAINTAINER Christian Groll

USER root
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y build-essential

USER juliauser

Add ./setup_julia.sh /tmp/
RUN /bin/bash /tmp/setup_julia.sh

EXPOSE 8888
WORKDIR /home/juliauser/
CMD jupyter notebook
