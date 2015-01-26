FROM beakernotebook/beaker

MAINTAINER Christian Groll

Add ./setup_julia_and_r.sh /tmp/
RUN /bin/bash /tmp/setup_julia_and_r.sh

EXPOSE 8800
WORKDIR /home/beaker/src
CMD su -m beaker -c "export PATH=$PATH:/usr/sbin && /home/beaker/src/core/beaker.command --public-server"
