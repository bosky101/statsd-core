FROM shykes/nodejs:latest

MAINTAINER Bhasker Kode "bosky101@gmail.com"

RUN mkdir /data /var/run/sshd
RUN cd /data

# get git
RUN apt-get install -q -y wget libssl-dev

RUN wget https://github.com/etsy/statsd/archive/v0.6.0.tar.gz --no-check-certificate
RUN tar -xvzf v0.6.0.tar.gz

RUN npm install -g forever

ADD ./config.js /data/config.js

RUN cat /data/config.js

run echo "interactive usage:"
run echo "docker run -p 8125 -i -t bosky101/docker-statsd:latest /statsd-0.6.0/stats.js /data/config.js"
run echo ""
run echo "daemon usage:"
run echo "docker run -p 8125 -d -t bosky101/docker-statsd:latest forever start /statsd-0.6.0/stats.js /data/config.js"


