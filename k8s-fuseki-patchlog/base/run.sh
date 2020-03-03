#!/bin/sh
##

java \
	-Xms256m \
	-Xmx512m \
	-Dlog4j.configurationFile=log4j2.xml \
	-Dlog4j.configuration=delta \
	-Djute.maxbuffer=100000000 \
	-jar delta-server.jar \
	--zk=zookeeper:2181/s32 \
	--s3profile=trinidata \
	--s3region=us-east-2 \
	--s3keys=s3.ini \
	--s3endpoint=https://s3.endpoint-of-local-s3.some \
	--s3bucket=abc
