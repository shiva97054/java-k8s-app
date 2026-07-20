FROM eclipse-temurin:21-jre

WORKDIR /app

COPY target/java-k8s-app-1.0-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
