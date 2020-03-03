#!/bin/sh
##

java \
	-Xms512m \
	-Xmx2048m \
	-Djute.maxbuffer=100000000 \
	-jar delta-fuseki.jar \
	--ping \
	--stats \
	--base data \
	--conf conf.ttl

