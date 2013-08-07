# docker-statsd

## Setup

Create a config.js file locally ( see the .js file in this repo as an example )

## Pull the image

### From the Docker index
	
	docker pull bosky101/docker-statsd

### From github

	docker build github.com/bosky101/docker-statsd

## Run statsd

Sets up a container with statsd installed listening on port 8125. 

The port, graphiteHost, graphitePort are configurable.

To test the container, run as follows

	docker run -i -t bosky101/docker-statsd node /statsd-0.6.0/stats.js /data/config.js

To run statsd within the container in daemon mode

	docker run -d -t bosky101/docker-statsd forever start /statsd-0.6.0/stats.js /data/config.js
	
Your statsd instance is now available

## To use as a base within your own docker image

First pull the image, then use it as a base.

	docker build github.com/bosky101/docker-statsd

Verify that the image exists

	docker images

Place it as a base within your dockfile

	FROM bosky101/docker-statsd	
	


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
