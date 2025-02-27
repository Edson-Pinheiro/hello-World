# Etapa de construção com Maven
FROM maven:3.8.7-eclipse-temurin-17 AS build

WORKDIR /app

# Copiar todo o conteúdo da pasta 'simple-project' para dentro do contêiner
COPY simple-project/ .

# Rodar o Maven para construir o JAR
RUN mvn clean package

# Etapa para rodar o JAR
FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

# Copiar o JAR gerado pela primeira etapa
COPY --from=build /app/simple-project/target/simple-project-1.0-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-cp", "app.jar", "com.pinheiro.App"]
