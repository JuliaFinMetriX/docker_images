FROM jupyter/demo

MAINTAINER Christian Groll

USER root
RUN apt-get install -y libboost-all-dev
RUN apt-get install -y libgomp1
# RUN apt-get install -y libnlopt-dev 
RUN apt-get install -y wget

USER jovyan

Add ./nlopt_install.sh /tmp/
RUN /bin/bash /tmp/nlopt_install.sh

USER root
RUN cd /home/jovyan/programs/nlopt-2.4.2 && ./configure && make && make install
USER jovyan

Add ./setup_julia_and_r.sh /tmp/
RUN /bin/bash /tmp/setup_julia_and_r.sh

EXPOSE 8888
WORKDIR /home/jovyan/
CMD ipython3 notebook
