FROM base
MAINTAINER Bhasker Kode "bosky101@gmail.com"

# Make dpkg happy with the upstart issue
run dpkg-divert --local --rename --add /sbin/initctl
run ln -s /bin/true /sbin/initctl

run echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

# Set ssh superuser (username: admin   password: admin)
run mkdir /data /var/run/sshd
run useradd -m -d /data/buildbot -p sa1aY64JOY94w admin
run sed -Ei 's/adm:x:4:/admin:x:4:admin/' /etc/group
run sed -Ei 's/(\%admin ALL=\(ALL\) )ALL/\1 NOPASSWD:ALL/' /etc/sudoers

# get git
run apt-get install -q -y git libssl-dev

run git clone git@github.com:etsy/statsd.git
run cd statsd
add config.js config.js

run cd stats
run cd ls
run cat config.js

EXPOSE 8125

ENTRYPOINT ["/statsd"]

CMD ["node", "stat.js", "config.js"]




