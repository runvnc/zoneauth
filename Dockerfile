# nsd with Node.js zone updater
FROM dockerfile/nodejs
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y -q update
RUN apt-get -y -q install nsd3 ipv6calc task-spooler
ADD . /opt/localserver
RUN cd /opt/localserver
ADD nsd.conf /etc/nsd/
WORKDIR /opt/localserver
EXPOSE 53
CMD "./cmdproc"
