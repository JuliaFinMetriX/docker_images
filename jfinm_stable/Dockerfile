FROM juliacomputing/juliapro

MAINTAINER Christian Groll

USER root
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y build-essential
RUN apt-get install -y git

USER juliauser

Add ./setup_jfinm.sh /tmp/
RUN /bin/bash /tmp/setup_jfinm.sh

EXPOSE 8888
WORKDIR /home/juliauser/
CMD jupyter notebook
