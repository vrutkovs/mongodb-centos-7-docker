FROM centos:centos7
MAINTAINER The CentOS Project <cloud-ops@centos.org>
RUN yum -y update && \
    yum -y install epel-release \
                   mongodb-server && \
    yum clean all && \
    mkdir -p /data/db
LABEL BZComponent="mongodb"
LABEL Version="3.2.8"
LABEL Release="1"
LABEL HELP="Mongo (from 'humongous') is a high-performance, open source, schema-free document-oriented database. MongoDB is written in C++ and offers the following features: * Collection oriented storage: easy storage of object/JSON-style data * Dynamic queries * Full index support, including on inner objects and embedded arrays * Query profiling * Replication and fail-over support * Efficient storage of binary data including large objects (e.g. photos and videos) * Auto-sharding for cloud-level scalability (currently in early alpha) * Commercial Support Available A key goal of MongoDB is to bridge the gap between key/value stores (which are fast and highly scalable) and traditional RDBMS systems (which are deep in functionality)."
LABEL RUN="docker run -ti -v /data:/data/db mongo-centos-7:latest"
EXPOSE 27017
ENTRYPOINT ["/usr/bin/mongod"]
