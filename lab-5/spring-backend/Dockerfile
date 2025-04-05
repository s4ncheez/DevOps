# Build
FROM adoptopenjdk/openjdk11:alpine AS build

WORKDIR /app

RUN apk add maven

COPY pom.xml .

RUN mvn -N io.takari:maven:wrapper

COPY mvnw .

RUN dos2unix mvnw

RUN ./mvnw dependency:go-offline -B

COPY src src

RUN ./mvnw package -DskipTests
RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)


# Run
FROM openjdk:11-jre-slim

COPY --from=build /app/target/dependency/BOOT-INF/lib /app/lib
COPY --from=build /app/target/dependency/META-INF /app/META-INF
COPY --from=build /app/target/dependency/BOOT-INF/classes /app

EXPOSE 8080

ENTRYPOINT ["java", "-cp", "app:app/lib/*", "backend.hobbiebackend.HobbieBackendApplication"]