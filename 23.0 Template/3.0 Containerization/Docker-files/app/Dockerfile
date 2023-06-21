# build the image
FROM openjdk:11 AS BUILD_IMAGE
# install maven
RUN apt update && apt install maven -y
# clone the source code
RUN git clone https://github.com/devopshydclub/vprofile-project.git
# build the artifact
RUN cd vprofile-project && git checkout docker && mvn install

FROM tomcat:9-jre11
# remove the default artifact
RUN rm -rf /usr/local/tomcat/webapps/*
# get the build artifact into tomcat
COPY --from=BUILD_IMAGE vprofile-project/target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]