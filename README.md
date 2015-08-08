# docker-zookeeper

Simple Docker image for Zookeeper. 

Based on Java 8 JRE https://hub.docker.com/_/java/. 

Run with:

    docker run -d -p 2181:2181 -p 2888:2888 -p 3888:3888 amouat/zookeeper
    
Configuration file is at `/zookeeper/conf/zoo.cfg` - override this in a volume or child image to configure.

This image attempts to validate the downloaded version of Zookeeper by checking the .asc file.


