FROM openjdk
MAINTAINER Piotr Minkowski <piotr.minkowski@gmail.com>
ADD target/account-service-jenkins.jar account-service-jenkins.jar
ENTRYPOINT ["java", "-jar", "/account-service-jenkins.jar"]
EXPOSE 2222
