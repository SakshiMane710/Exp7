install docker

clone exp7 

for error paste this code 


import com.sun.net.httpserver.HttpServer;
import java.net.InetSocketAddress;
import java.io.OutputStream;

public class App {
    public static void main(String[] args) throws Exception {

        HttpServer server = HttpServer.create(
            new InetSocketAddress(8080), 0
        );

        server.createContext("/", exchange -> {
            String response = "Hello! Java Application Running Inside Docker!";

            exchange.sendResponseHeaders(200, response.length());

            try (OutputStream os = exchange.getResponseBody()) {
                os.write(response.getBytes());
            }
        });

        server.start();

        System.out.println("Server started on port 8080");
    }
}


inside Dockerfile


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

Open Docker Desktop --- in cmd ---- docker build -t java-docker-app:1.0 . ---- docker images

docker run -d -p 8080:8080 --name java-container java-docker-app:1.0

docker ps

http://localhost:8080
