
FROM maven
MAINTAINER tsvyake@gmail.com
RUN apt update && apt upgrade -y
RUN apt install -y mc
RUN apt install -y htop
RUN apt install -y wget
RUN apt install -y git
WORKDIR /tmp
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
WORKDIR /tmp/boxfuse-sample-java-war-hello/
RUN mvn clean install
WORKDIR /tmp/boxfuse-sample-java-war-hello/target/
RUN mv  hello-1.0.war  /tmp
