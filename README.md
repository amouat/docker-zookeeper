# docker-zookeeper

Simple Docker image for Zookeeper. 

Based on Java 8 JRE https://hub.docker.com/_/java/.

Configuration file is at `/zookeeper/conf/zoo.cfg` - override this in a volume or child image to configure.

This image attempts to validate the downloaded version of Zookeeper by checking the .asc file.


