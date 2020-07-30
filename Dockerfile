FROM ubuntu:19.10
MAINTAINER tim@chaubet.be
LABEL title="3dprint Timelapser"
LABEL description="A docker container that will automatically \
- timelapse existing picture files in the attached volume, when no new pictures are coming in for a set time. The picture files are supposed to arrive from a motion sensor camera. \
- move the pictures to a backup folder or remove them after the timelapse process, as set. \
- move the timelapse video to a specified location"
ENV TZ 'Europe/Brussels'

ARG DEBIAN_FRONTEND=noninteractive
RUN DEBIAN_FRONTEND=noninteractive apt-get update \
 && echo $TZ > /etc/timezone \
 && apt-get install -y	ffmpeg 

COPY start.sh /start.sh
RUN chmod +x /start.sh

VOLUME ["/mnt/timelapse_vids","/mnt/cache"]

EXPOSE 80

#ENTRYPOINT ["tail", "-f", "/dev/null"]
CMD ["/start.sh"]

