FROM maven:3.6-jdk-8 as build
WORKDIR /build
COPY . .
ENV MAVEN_OPTS="-Dmaven.test.skip=true -Drat.skip=true -Dhttps.protocols=TLSv1.2 -Dmaven.repo.local=$CI_PROJECT_DIR/.m2/repository -Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=WARN -Dorg.slf4j.simpleLogger.showDateTime=true -Djava.awt.headless=true"
ENV	MAVEN_CLI_OPTS="--batch-mode --errors --fail-at-end --show-version -DinstallAtEnd=true -DdeployAtEnd=false"
RUN mvn $MAVEN_CLI_OPTS verify

FROM openjdk:8
WORKDIR /app
COPY --from=build /build/rdf-delta-fuseki-server/target/rdf-delta-fuseki-server-0.8.2.jar /app/delta-fuseki.jar
COPY --from=build /build/rdf-delta-server/target/rdf-delta-server-0.8.2.jar /app/delta-server.jar
COPY --from=build /build/rdf-delta-dist/Files/dcmd /app/dcmd
EXPOSE 1060 3030
CMD /app/run.sh
