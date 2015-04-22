FROM jupyter/demo

MAINTAINER Christian Groll

USER root
RUN apt-get install -y libnlopt0
RUN apt-get install -y libboost-all-dev
RUN apt-get install -y libgomp1
RUN apt-get install -y wget

USER jovyan

Add ./setup_jfinm.sh /tmp/
RUN /bin/bash /tmp/setup_jfinm.sh

# RUN julia --eval 'Pkg.test("Copulas")'
# RUN julia --eval 'Pkg.test("Econometrics")'
# RUN julia --eval 'Pkg.test("TimeData")'
# RUN julia --eval 'Pkg.test("WorldBankDataTd")'
# RUN julia --eval 'Pkg.test("EconDatasets")'


EXPOSE 8888
WORKDIR /home/jovyan/
CMD ipython3 notebook
