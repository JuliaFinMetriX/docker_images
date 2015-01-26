FROM jupyter/demo

MAINTAINER Christian Groll

Add ./setup_julia_and_r.sh /tmp/
RUN /bin/bash /tmp/setup_julia_and_r.sh

EXPOSE 8888
USER jovyan
WORKDIR /home/jovyan/
CMD ipython3 notebook
