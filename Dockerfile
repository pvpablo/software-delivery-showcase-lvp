FROM openjdk:11-jdk
RUN addgroup spring && adduser  spring --ingroup spring
USER spring:spring
# The following lines use a fat JAR. target/dependency assets are created using the following command:
# mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)
# ARG DEPENDENCY=target/dependency
# COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
# COPY ${DEPENDENCY}/META-INF /app/META-INF
# COPY ${DEPENDENCY}/BOOT-INF/classes /app
# ENTRYPOINT ["java","-cp","app:app/lib/*","com.example.SpringBootDemoApplication"]
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]