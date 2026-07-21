# ── Stage 1: Build ────────────────────────────────────────────────────────────
FROM maven:3.9-eclipse-temurin-11 AS build

WORKDIR /app

# Copy pom first so Maven dependency layer is cached between builds
COPY pom.xml .
RUN mvn dependency:go-offline -q

# Copy source and build the WAR
COPY src ./src
RUN mvn clean package -q -DskipTests

# ── Stage 2: Run ──────────────────────────────────────────────────────────────
FROM tomcat:9.0-jdk11-temurin

# Remove default Tomcat sample apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Drop our WAR as ROOT so it's served at / (not /StudentRegistrationSystem)
COPY --from=build /app/target/StudentRegistrationSystem.war \
     /usr/local/tomcat/webapps/ROOT.war

# Render routes external traffic to port 8080 — Tomcat's default, no change needed
EXPOSE 8080

CMD ["catalina.sh", "run"]
