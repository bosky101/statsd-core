# docker-statsd

There are three ways of getting up the image. Once setup they statsd can be run.

## Step1: Pull the image

### From the Docker index ( cannot configure ports )
	
	docker pull bosky101/docker-statsd

### From github ( cannot configure ports )

	docker build -t bosky101/docker-statsd github.com/bosky101/docker-statsd

### From Dockerfile (can configure ports,etc )

	git clone github.com/bosky101/docker-statsd
	cd docker-statsd
	cat config.js #edit this file as you wish, but keep the filename intact
	docker build .

## Step2: Run statsd

To test the container, run as follows

	docker run -i -t bosky101/docker-statsd:latest node /statsd-0.6.0/stats.js /data/config.js

To run statsd within the container in daemon mode

	docker run -d -t bosky101/docker-statsd:latest forever start /statsd-0.6.0/stats.js /data/config.js
	
### Step3: Check if it's running

	docker images # should show the docker-stats image
	docker ps # should show the image with PORTS XYZ->8125/udp, 8126
	
	#test
	echo "stats" | nc $HOSTNAME 8126
	

Your statsd instance is now available

## To use as a base within your own docker image

First pull the image, then use it as a base.

	docker build github.com/bosky101/docker-statsd
	docker images # verify that image exists
	FROM bosky101/docker-statsd #place it as a base within your dockfile

## Author

Bhasker Kode (<bosky101@gmail.com>)

## LICENSE

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
