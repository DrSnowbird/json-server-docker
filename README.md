# JSON REST API Server Docker Container
[![](https://images.microbadger.com/badges/image/openkbs/json-server-docker.svg)](https://microbadger.com/images/openkbs/json-server-docker "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/openkbs/json-server-docker.svg)](https://microbadger.com/images/openkbs/json-server-docker "Get your own version badge on microbadger.com")

# Components
* [Base Container Image: openkbs/jdk-mvn-py3](https://github.com/DrSnowbird/jdk-mvn-py3)
* [Base Components: OpenJDK, Python 3, PIP, Node/NPM, Gradle, Maven, etc.](https://github.com/DrSnowbird/jdk-mvn-py3#components)


# JSON REST API Server Docker Container
To provide a JSON file with REST API NodeJS application

# Run Method 1 - using './json-server.sh'
```
Usage: json-server.sh [--help] \
    [-d/--docker_name <docker_name:json-server-docker>] \
    [-h/--port_host <port_host:13000>] \
    [-g/-port_guest <port_guest:3000>] \
    [-i/--ip_guest <ip_guest>] \
    <JSON_File_URL_or_FilePath>
(if zero argument provided, the default is to show the demo db.json)
```
# Run Method 2 - using './run.sh'
* 1.) copy your json file, e.g., "db.json" (has to have json as file extension!), to "./app" directory 
The "./app" directory will be your NodeJS app directory.

```
mkdir ./app
cp db.json ./app/
./run.sh
```
Note that the JSON file name should always have `.json` as file extension. If there is more than one JSON files in the `./app` directory, then only the first JSON file will be used to enable REST API Server!
* 2.) Or, using docker-compose

```
mkdir ./app
cp db.json ./app/
docker-compose up
```

Once start, you can access the NodeJS Web app:

```
curl -i http://0.0.0.0:3000
  or
curl -i http://<host_ip>:3000
```

# Run with different JSON files locations
```
./run.sh    (using default db.json or the first JSON file in ./app directory)
./run.sh http://192.168.0.160:18080/jetty_base/db.json
```

# Guide for json-server 
```
json-server [options] <source>

Options:
  --config, -c               Path to config file   [default: "json-server.json"]
  --port, -p                 Set port                            [default: 3000]
  --host, -H                 Set host                     [default: "localhost"]
  --watch, -w                Watch file(s)                             [boolean]
  --routes, -r               Path to routes file
  --middlewares, -m          Paths to middleware files                   [array]
  --static, -s               Set static files directory
  --read-only, --ro          Allow only GET requests                   [boolean]
  --no-cors, --nc            Disable Cross-Origin Resource Sharing     [boolean]
  --no-gzip, --ng            Disable GZIP Content-Encoding             [boolean]
  --snapshots, -S            Set snapshots directory              [default: "."]
  --delay, -d                Add delay to responses (ms)
  --id, -i                   Set database id property (e.g. _id) [default: "id"]
  --foreignKeySuffix, --fks  Set foreign key suffix (e.g. _id as in post_id)
                                                                 [default: "Id"]
  --quiet, -q                Suppress log messages from output         [boolean]
  --help, -h                 Show help                                 [boolean]
  --version, -v              Show version number                       [boolean]

Examples:
  json-server db.json
  json-server file.js
  json-server http://example.com/db.json
```
# Configuration - change
You can change the host port when using "./run.sh" as the following show how to define the mapping between host port and NodeJS container's internal port. Note that the "#" is mandatory and no space behind either for "#PORTS_LIST ..." 
```
(modify ./docker.env file)

#### ---- NodeJS Dockerizing Docker ---- ####
#PORTS_LIST="13000:3000"
```

## References
* [JSON file for REST API Server mocking in Docker Container](https://github.com/DrSnowbird/json-server)
* [Create A REST API With JSON Server](https://medium.com/codingthesmartway-com-blog/create-a-rest-api-with-json-server-36da8680136d)

# Release versions
```
developer@ae402cb8e6dd:~$ /usr/scripts/printVersions.sh 
+ echo JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
+ java -version
openjdk version "1.8.0_222"
OpenJDK Runtime Environment (build 1.8.0_222-8u222-b10-1ubuntu1~18.04.1-b10)
OpenJDK 64-Bit Server VM (build 25.222-b10, mixed mode)
+ mvn --version
Apache Maven 3.6.2 (40f52333136460af0dc0d7232c0dc0bcf0d9e117; 2019-08-27T15:06:16Z)
Maven home: /usr/apache-maven-3.6.2
Java version: 1.8.0_222, vendor: Private Build, runtime: /usr/lib/jvm/java-8-openjdk-amd64/jre
Default locale: en, platform encoding: UTF-8
OS name: "linux", version: "5.0.0-32-generic", arch: "amd64", family: "unix"
+ python -V
Python 2.7.15rc1
+ python3 -V
Python 3.6.7
+ pip --version
pip 19.2.3 from /usr/local/lib/python3.6/dist-packages/pip (python 3.6)
+ pip3 --version
pip 19.2.3 from /usr/local/lib/python3.6/dist-packages/pip (python 3.6)
+ gradle --version

Welcome to Gradle 5.6.2!

Here are the highlights of this release:
 - Incremental Groovy compilation
 - Groovy compile avoidance
 - Test fixtures for Java projects
 - Manage plugin versions via settings script

For more details see https://docs.gradle.org/5.6.2/release-notes.html


------------------------------------------------------------
Gradle 5.6.2
------------------------------------------------------------

Build time:   2019-09-05 16:13:54 UTC
Revision:     55a5e53d855db8fc7b0e494412fc624051a8e781

Kotlin:       1.3.41
Groovy:       2.5.4
Ant:          Apache Ant(TM) version 1.9.14 compiled on March 12 2019
JVM:          1.8.0_222 (Private Build 25.222-b10)
OS:           Linux 5.0.0-32-generic amd64

+ npm -v
6.12.0
+ node -v
v12.10.0
+ cat /etc/lsb-release /etc/os-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=18.04
DISTRIB_CODENAME=bionic
DISTRIB_DESCRIPTION="Ubuntu 18.04.2 LTS"
NAME="Ubuntu"
VERSION="18.04.2 LTS (Bionic Beaver)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 18.04.2 LTS"
VERSION_ID="18.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=bionic
UBUNTU_CODENAME=bionic
```
