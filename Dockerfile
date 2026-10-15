# -------------------------------------------------------------
# Stage 1: Build the Java application
# -------------------------------------------------------------
FROM eclipse-temurin:21-jdk-alpine AS builder

WORKDIR /build

# Copy source code
COPY src ./src

# Compile Java sources
RUN mkdir -p bin && \
    javac -encoding UTF-8 -d bin $(find src -name "*.java") && \
    jar cfe ApexTrade.jar com.stocktrading.Main -C bin .

# -------------------------------------------------------------
# Stage 2: Minimal Production Runtime
# -------------------------------------------------------------
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copy compiled JAR and web assets
COPY --from=builder /build/ApexTrade.jar ./ApexTrade.jar
COPY web ./web

# Permissions
RUN chown -R appuser:appgroup /app
USER appuser

# Environment variables
ENV PORT=8080
EXPOSE 8080

# Launch application
CMD ["java", "-jar", "ApexTrade.jar"]
