FROM ubuntu:14.04.2

MAINTAINER Barnabas Debreczeni <keo@goa.hu>

ENV DEBIAN_FRONTEND noninteractive

# Usual update / upgrade

RUN apt-get install -q -y software-properties-common
RUN add-apt-repository ppa:ethereum/ethereum
RUN add-apt-repository ppa:ethereum/ethereum-dev
RUN apt-get update
RUN apt-get upgrade -q -y
RUN apt-get install -q -y unattended-upgrades geth supervisor curl

ADD supervisord.conf supervisord.conf
ADD start.sh start.sh

EXPOSE 8545
EXPOSE 30303

CMD ["-c", "/supervisord.conf"]
ENTRYPOINT ["/usr/bin/supervisord"]
