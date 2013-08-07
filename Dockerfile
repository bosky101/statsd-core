FROM shykes/nodejs:latest

MAINTAINER Bhasker Kode "bosky101@gmail.com"

# Set ssh superuser (username: admin   password: admin)
run mkdir /data /var/run/sshd
cd /data

# get git
run apt-get install -q -y wget libssl-dev

run wget https://github.com/etsy/statsd/archive/v0.6.0.tar.gz --no-check-certificate
run tar -xvzf v0.6.0.tar.gz

#make daemon
run npm install -g forever

ENTRYPOINT ["forever"]

ADD ./config.js /data/config.js

run cat /data/config.js

#ENV STATS_DPORT `echo 50000`
#run echo "stats_dport is $STATS_DPORT"

CMD ["start","/statsd-0.6.0/stats.js","/data/config.js"]
