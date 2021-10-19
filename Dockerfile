FROM centos:7.3.1611

WORKDIR /tmp
RUN yum install -y java-1.8.0-openjdk-devel
RUN curl -O -L https://archive.apache.org/dist/kafka/2.4.1/kafka_2.12-2.4.1.tgz
RUN tar xvfz kafka_2.12-2.4.1.tgz -C /opt

RUN sed -i -e "s|^dataDir=.*|dataDir=/var/lib/zookeeper|" /opt/kafka_2.12-2.4.1/config/zookeeper.properties
RUN sed -i -e "s|^log\.dirs=.*|log\.dirs=/var/lib/kafka|" /opt/kafka_2.12-2.4.1/config/server.properties
RUN sed -i -e "s|^zookeeper\.connect=.*|zookeeper\.connect=zookeeper:2181|" /opt/kafka_2.12-2.4.1/config/server.properties
RUN sed -i -e "s|^num\.partitions=.*|num\.partitions=1|" /opt/kafka_2.12-2.4.1/config/server.properties

WORKDIR /opt/kafka_2.12-2.4.1