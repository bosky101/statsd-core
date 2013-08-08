FROM shykes/nodejs:latest

MAINTAINER Bhasker Kode "bosky101@gmail.com"

RUN mkdir /data /var/run/sshd

# get git
RUN apt-get install -q -y wget libssl-dev

RUN wget https://github.com/etsy/statsd/archive/v0.6.0.tar.gz --no-check-certificate
RUN tar -xvzf v0.6.0.tar.gz

RUN npm install -g forever

ADD config.js /data/config.js
ADD Done.md /data/docker-statsd-README.md

EXPOSE [8125/udp]
EXPOSE [8125]
EXPOSE [8126]

RUN cat /data/config.js
RUN cat /data/docker-statsd-README.md
