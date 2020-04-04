FROM maven:3.6.3-jdk-11-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app

RUN cd /home/app && mvn package -DskipTests


FROM openjdk:8-jre-slim

COPY --from=build /home/app/target/articulate-0.0.1-SNAPSHOT.jar /app.jar

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]