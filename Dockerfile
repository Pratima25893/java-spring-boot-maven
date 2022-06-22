FROM openjdk:8
ADD /var/lib/jenkins/workspace/springbootmaven/target/hello-world-spring-boot-pom-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
