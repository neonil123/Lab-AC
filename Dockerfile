FROM maven:3 AS build
COPY src     /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package

FROM openjdk:17-oracle
COPY --from=build /usr/app/target/app-1.jar /usr/app/app-1.jar
EXPOSE 8084
ENTRYPOINT ["java","-jar","/usr/app/app-1.jar"]

