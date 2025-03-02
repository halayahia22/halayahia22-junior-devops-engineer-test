# Use an official Java runtime as a parent image
FROM amazoncorretto:11 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the application JAR file (Ensure your JAR name matches)
COPY . .

RUN ./gradlew clean build

FROM amazoncorretto:11-alpine

WORKDIR /app

COPY --from=build /app/build/libs/demo-0.0.1-SNAPSHOT.jar .

# Expose the application port
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]
