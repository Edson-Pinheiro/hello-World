# Etapa 1: Compilação do projeto
FROM maven:3.8.7-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .  # Copia o código-fonte para dentro do contêiner
RUN mvn clean package -f src/main/pom.xml  # Executa o build no pom.xml correto

# Etapa 2: Criação da imagem final
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app
#COPY --from=build /app/src/main/target/simple-project-1.0-SNAPSHOT.jar app.jar
#COPY ./simple-project /app
COPY simple-project/ /app/

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
