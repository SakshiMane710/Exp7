
# Use Java 17 image
FROM eclipse-temurin:17-jdk

# Set working directory
WORKDIR /app

# Copy Java source code
COPY App.java .

# Compile Java application
RUN javac App.java

# Expose application port
EXPOSE 8080

# Run Java application
CMD ["java", "App"]
