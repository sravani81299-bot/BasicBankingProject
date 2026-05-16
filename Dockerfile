FROM openjdk:17

WORKDIR /app

COPY target/banking-app-1.0.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]
