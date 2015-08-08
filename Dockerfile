FROM java:8-jre

RUN groupadd -r zookeeper && useradd -r -g zookeeper zookeeper
RUN apt-get install -y ca-certificates curl

ENV ZOOKEEPER_VERSION 3.4.6
ENV ZOOKEEPER_URL http://apache.mirrors.pair.com/zookeeper/zookeeper-$ZOOKEEPER_VERSION/zookeeper-$ZOOKEEPER_VERSION.tar.gz
ENV ZOOKEEPER_KEY_URL https://www.apache.org/dist/zookeeper/zookeeper-$ZOOKEEPER_VERSION/zookeeper-$ZOOKEEPER_VERSION.tar.gz.asc

# Flavio Junqueira (CODE SIGNING KEY) <fpj@apache.org>
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 1D3D275F61D8E2B589C19FD093FB0254D2C80E32

RUN curl -SL "$ZOOKEEPER_URL" -o zook.tar.gz \
	&& curl -SL "$ZOOKEEPER_KEY_URL" -o zook.tar.gz.asc \
	&& gpg --verify zook.tar.gz.asc \
        && tar -xvf zook.tar.gz \
        && mv /zookeeper-$ZOOKEEPER_VERSION /zookeeper \
        && cp /zookeeper/conf/zoo_sample.cfg /zookeeper/conf/zoo.cfg

WORKDIR /zookeeper

ENTRYPOINT ["/zookeeper/bin/zkServer.sh"]
CMD ["start-foreground"]

EXPOSE 2181 2888 3888
