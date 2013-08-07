# docker-statsd

Sets up a container with statsd installed listening on port 8125. 

The port, graphiteHost, graphitePort are configurable.

## Usage

To run the container, do the following:

```
docker run -d bosky101/statsd {graphitePort: 49238, graphiteHost:"localhost", port:50000}
docker ps
ID                  IMAGE                     COMMAND                CREATED
STATUS              PORTS
```

Your statsd instance is now available

## Building

To build the image, simply invoke

```
docker build github.com/bosky101/docker-statsd
```

A prebuilt container is also available in the docker index

```
docker pull bosky101/statsd
```



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
