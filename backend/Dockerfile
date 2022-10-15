FROM maven:3.8.3-openjdk-17 AS build
COPY . /home/app
WORKDIR /home/app
RUN mvn install -DSkipTests
WORKDIR /home/app/application
RUN mvn package

FROM openjdk:17-slim
EXPOSE 8080

RUN mkdir /app
COPY --from=build /home/app/application/target/*.jar /app/application.jar
ENTRYPOINT ["java","-jar","-Dspring.profiles.active=prod","/app/application.jar"]
