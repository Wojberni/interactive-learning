FROM openjdk:17-slim
EXPOSE 8080

ARG FIREBASE_CREDENTIALS
ENV FIREBASE_CREDENTIALS $FIREBASE_CREDENTIALS
ENV GOOGLE_APPLICATION_CREDENTIALS /app/firebase-credentials.json

RUN mkdir /app
COPY ./application/target/*.jar /app/application.jar

RUN echo $FIREBASE_CREDENTIALS | base64 -di > /app/firebase-credentials.json
ENTRYPOINT ["java","-jar","-Dspring.profiles.active=prod,notifications,firebase","/app/application.jar"]
