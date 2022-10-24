FROM openjdk:17-slim
EXPOSE 8080

RUN mkdir /app
COPY ./application/target/*.jar /app/application.jar
ENTRYPOINT ["java","-jar","-Dspring.profiles.active=prod","/app/application.jar"]
