# Use the OpenJDK 17 slim image as the base image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the crewmeister application JAR file into the container's working directory
COPY target/crewmeisterchallenge-0.0.1-SNAPSHOT.jar crewmeister.jar

# Expose port 8080 to allow external access to the application
EXPOSE 8080

# Set the command to run the application when the container starts
ENTRYPOINT ["java", "-jar", "crewmeister.jar"]
