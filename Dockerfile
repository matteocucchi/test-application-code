# syntax=docker/dockerfile:1
FROM openjdk
WORKDIR /app
COPY Application.java Application.java
RUN javac Application.java

COPY . .

CMD ["java", "Application"]
