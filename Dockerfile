FROM ubuntu:19.10
MAINTAINER tim@chaubet.be
LABEL title="3dprint Timelapser"
ENV TZ 'Europe/Brussels'

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
 && echo $TZ > /etc/timezone \
 && apt-get install -y	mmpeg 

ENTRYPOINT ["tail", "-f", "/dev/null"]
CMD ["bash"]

