# nsd with Node.js zone updater
FROM dockerfile/nodejs
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y -q update
RUN mkdir /etc/nsd3/
RUN touch /etc/nsd3/nsd.conf
RUN apt-get -y -q install nsd3 ipv6calc
RUN npm install -g coffee-script
RUN npm install -g toffee-script
ADD ./package.json /opt/localserver/
RUN cd /opt/localserver && npm install
ADD . /opt/localserver
RUN cd /opt/localserver

ADD nsd.conf /etc/nsd3/
ADD addzone /usr/bin/
ADD makezone /usr/bin/
