FROM openjdk:8
ADD target/springboot-docker.jar springboot-docker.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "springboot-docker.jar"]


FROM openjdk:8-jdk-alpine
VOLUME /c/Users/eresh.gorantla/
COPY ./target/spring-cloud-discovery-0.0.1-SNAPSHOT.jar app.jar
ENV JAVA_OPTS=""
ENTRYPOINT exec java -jar app.jar --info


FROM openjdk:8

ADD target/javaexpress-springboot-docker.jar javaexpress-springboot-docker.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","javaexpress-springboot-docker.jar"]