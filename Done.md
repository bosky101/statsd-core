Assuming the image is tagged bosky101/docker-statsd
eg: docker pull bosky101/docker-statsd
OR
eg: docker build -t bosky101/docker-statsd github.com/bosky101/docker-statsd

To test the container, run:

        docker run -i -t bosky101/docker-statsd:latest node /statsd-0.6.0/stats.js /data/config.js

To run statsd within the container in daemon mode, run:

        docker run -d -t bosky101/docker-statsd:latest node /statsd-0.6.0/stats.js /data/config.js
