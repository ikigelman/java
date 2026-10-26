
FROM maven:3.9-eclipse-temurin-11 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn package

FROM eclipse-temurin:11-jre

WORKDIR /app

COPY --from=build /app/target/hello-sonar-1.0-SNAPSHOT.jar app.jar

CMD ["java", "-jar", "app.jar"]
