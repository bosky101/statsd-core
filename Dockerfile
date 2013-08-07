FROM ubuntu:12.04

MAINTAINER Bhasker Kode "bosky101@gmail.com"

# Make dpkg happy with the upstart issue
run dpkg-divert --local --rename --add /sbin/initctl
run ln -s /bin/true /sbin/initctl

#run echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

# Set ssh superuser (username: admin   password: admin)
run mkdir /data /var/run/sshd

# get git
run apt-get install -q -y wget libssl-dev #git

run wget https://github.com/etsy/statsd/archive/v0.6.0.tar.gz --no-check-certificate
run tar -xvzf v0.6.0.tar.gz

#run git clone git@github.com:etsy/statsd.git
run cd statsd-0.6.0
add config.js config.js

run cd stats
run cd ls
run cat config.js

EXPOSE 8125

ENTRYPOINT ["/statsd-0.6.0"]

CMD ["node", "stat.js", "config.js"]




