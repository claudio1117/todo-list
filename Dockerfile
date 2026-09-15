# Etapa 1: Build da aplicação Java com Gradle
FROM gradle:8.6-jdk21 AS build
WORKDIR /app
COPY . .
# Apaga o gradle.properties local dentro do container para não conflitar com caminhos de Java do seu SO
RUN rm -f gradle.properties
RUN ./gradlew bootJar --no-daemon

# Etapa 2: Execução com imagem JDK leve
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=build /app/build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]