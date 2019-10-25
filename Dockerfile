FROM koosiedemoer/netty-tcnative-alpine
COPY /target/DemoMavenProject-1.0-SNAPSHOT.jar /
CMD java -jar -cvfe DemoMavenProject-1.0-SNAPSHOT.jar
