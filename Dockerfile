# Etapa 1: Usar uma imagem base com Maven para construir o projeto
FROM maven:3.8.7-eclipse-temurin-17 AS build

# Definir o diretório de trabalho
WORKDIR /app

# Copiar o código-fonte para o contêiner
COPY . .

# Compilar e empacotar o projeto com Maven
RUN mvn clean package

# Etapa 2: Usar uma imagem com JDK para rodar o JAR
FROM eclipse-temurin:17-jdk-jammy

# Definir o diretório de trabalho no contêiner
WORKDIR /app

# Copiar o JAR gerado pela etapa de build
COPY --from=build /app/target/simple-project-1.0-SNAPSHOT.jar app.jar

# Comando para rodar a aplicação Java
CMD ["java", "-jar", "app.jar"]
