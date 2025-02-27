# Etapa de build
FROM maven:3.8.7-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Etapa final
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app

# Copia o JAR gerado do estágio de build
COPY --from=build /app/target/simple-project-1.0-SNAPSHOT.jar app.jar

CMD ["java", "-jar", "app.jar"]
