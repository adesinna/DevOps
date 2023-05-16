# from builds from the base image
FROM ubuntu:latest
# you can have as much label as you can
LABEL "Author"="Adesina"
LABEL "Project"="clean website"
LABEL "Project Support"="Aunty Tolani"
# not to make it interactive
ENV DEBIAN_FRONTEND=noninteractive
# Combine layers is good, but we are going to use two laywes
RUN apt update && apt install git -y
RUN apt install apache2 -y
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
# this is the folder the commands
WORKDIR /var/www/html
# volume where it will be stored
VOLUME /var/log/apache2
# ADD Will unzip unlike copy
ADD clean.tar.gz /var/www/html

