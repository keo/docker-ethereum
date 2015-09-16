FROM ubuntu:14.04.3

MAINTAINER Barnabas Debreczeni <keo@goa.hu>

ENV DEBIAN_FRONTEND noninteractive

# Usual update / upgrade
RUN apt-get install -q -y software-properties-common
RUN add-apt-repository -y ppa:ethereum/ethereum
RUN add-apt-repository -y ppa:ethereum/ethereum-dev
RUN apt-get update
RUN apt-get upgrade -q -y
RUN apt-get install -q -y unattended-upgrades git supervisor curl


# compile
RUN apt-get install -q -y build-essential libgmp3-dev golang
RUN git clone https://github.com/ethereum/go-ethereum
RUN cd go-ethereum && make geth
RUN cp /go-ethereum/build/bin/geth /usr/local/bin/

ADD supervisord.conf supervisord.conf
ADD start.sh start.sh
RUN mkdir /root/.ethereum

# cleanup
RUN rm -rf /go-ethereum /var/lib/apt/lists/* /tmp/* /var/tmp/*


EXPOSE 8545
EXPOSE 30303

CMD ["-c", "/supervisord.conf"]
ENTRYPOINT ["/usr/bin/supervisord"]
