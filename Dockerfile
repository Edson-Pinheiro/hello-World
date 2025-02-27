# Etapa 1: Compilação do projeto
FROM maven:3.8.7-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Etapa 2: Criação da imagem final
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app
COPY --from=build /app/target/simple-project-1.0-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-cp", "app.jar", "com.pinheiro.App"]

