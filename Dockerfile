FROM koosiedemoer/netty-tcnative-alpine
COPY /target/DemoMavenProject-1.0-SNAPSHOT-demo.jar /
CMD java -jar DemoMavenProject-1.0-SNAPSHOT-demo.jar
