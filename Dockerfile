# Etapa 1: Construcción
FROM eclipse-temurin:17-jdk-alpine AS build
WORKDIR /app

# Copiar archivos de Maven
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Dar permisos de ejecución al wrapper de Maven
RUN chmod +x mvnw

# Descargar dependencias (capa cacheada)
RUN ./mvnw dependency:go-offline -B

# Copiar código fuente
COPY src src

# Construir el JAR
RUN ./mvnw package -DskipTests

# Etapa 2: Ejecución
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Copiar JAR desde la etapa de construcción
COPY --from=build /app/target/*.jar app.jar

# Exponer puerto
EXPOSE 8080

# Ejecutar aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
