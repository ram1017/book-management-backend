# Use Java 21 base image
FROM eclipse-temurin:21-jdk

# Set working directory
WORKDIR /app

# Copy everything into the container
COPY . .

RUN chmod +x mvnw

# Build the app using Maven Wrapper (skip tests to save time)
RUN ./mvnw clean package -DskipTests

# Run the JAR file from target directory
CMD ["java", "-jar", "target/*.jar"]
