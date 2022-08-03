
FROM ubuntu:20.04
MAINTAINER tsvyake@gmail.com
RUN mkdir /opt/tomcat/
RUN useradd -m -d /opt/tomcat -U -s /bin/false tomcat
RUN apt update && apt upgrade -y
RUN apt install -y default-jdk
RUN apt install -y mc
RUN apt install -y htop
RUN apt install -y wget
RUN apt install -y maven
RUN apt install -y git
#WORKDIR /tmp
#RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
#WORKDIR /tmp/boxfuse-sample-java-war-hello/
#RUN mvn clean install
WORKDIR /opt/tomcat
RUN wget  https://dlcdn.apache.org/tomcat/tomcat-10/v10.0.23/bin/apache-tomcat-10.0.23.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-10.0.23/* /opt/tomcat/.
RUN java -version
#RUN wget https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz -P /tmp
#RUN tar xf /tmp/apache-maven-*.tar.gz -C /opt
#RUN ln -s /opt/apache-maven-3.8.4 /opt/maven
#ADD maven.sh /etc/profile.d
#RUN chmod +x /etc/profile.d/maven.sh
#RUN source /etc/profile.d/maven.sh
#RUN mvn -version
#WORKDIR /opt/tomcat/webapps
#RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
#RUN cd boxfuse-sample-java-war-hello
#RUN mvn package
WORKDIR /tmp
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
WORKDIR /tmp/boxfuse-sample-java-war-hello/
RUN mvn clean install
WORKDIR /tmp/boxfuse-sample-java-war-hello/target/
RUN mv  hello-1.0.war  /opt/tomcat/webapps
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
