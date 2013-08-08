Assuming the image is tagged bosky101/docker-statsd
eg: docker pull bosky101/statsd-core (lets your start the daemon )
OR
eg: docker build -t bosky101/docker-statsd github.com/bosky101/docker-statsd
OR 
eg: docker pull bosky101/statsd ( starts daemon )

To test the container, run:

        docker run -i -t bosky101/statsd-core:latest node /statsd-0.6.0/stats.js /data/config.js

To run statsd within the container in daemon mode, run:

	docker run -d bosky101/statsd:latest
	OR
        docker run -d -t bosky101/statsd-core:latest node /statsd-0.6.0/stats.js /data/config.js

	
To run statsd on specific ports (8125 for UDP, 8126 for TCP admin. Defaults)

	docker run -p 8125:8125/udp -p 8126:8126 -d  bosky101/statsd:latest
	OR
	docker run -p 8125:8125/udp -p 8126:8126 -d  bosky101/statsd-core:latest node /statsd-0.6.0/stats.js /data/config.js

To test (assuming this was on stats.example.com)

	echo "stats" | nc stats.example.com 8126

	uptime: 32
	messages.last_msg_seen: 32
	messages.bad_lines_seen: 0
	graphite.last_flush: 32
	graphite.last_exception: 32
	graphite.flush_time: 0
	graphite.flush_length: 0
	END
