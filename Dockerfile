FROM maven:3.6.0-jdk-17-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM  eclipse-temurin:17.0.8.1_1-jdk-focal
# Set the working directory
WORKDIR /app
# Copy the JAR file to the container
COPY target/SpringBootAuth2_Github-0.0.1-SNAPSHOT.jar app.jar
# Expose the port that your Spring Boot application listens on (default is 8080)
EXPOSE 8080
# Define the command to run your application
CMD ["java", "-jar", "app.jar"]