############################################################
# Dockerfile to build Ocelli Server
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER Mick Dreeling
RUN sudo apt-get update
RUN sudo apt-get install -y git-core

# Get Source
RUN git clone https://github.com/mdreeling/ocelli /opt/ocelli

# Config
ADD ./start-server.sh /usr/bin/start-server
RUN chmod +x /usr/bin/start-server

# Basics
RUN sudo apt-get install -y curl
RUN sudo apt-get install -y unzip

# Install Nginx

# Add application repository URL to the default sources
RUN echo "deb http://archive.ubuntu.com/ubuntu/ raring main universe" >> /etc/apt/sources.list

# Update the repository
RUN apt-get install -y nano wget dialog net-tools
RUN apt-get install -y nginx

# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Install ElasticSearch

RUN cd ~
RUN sudo apt-get install openjdk-7-jdk -y
RUN wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.2.1.deb
RUN sudo dpkg -i elasticsearch-1.2.1.deb

# Install Grails
ADD ./install-grails.sh /usr/bin/install-grails
RUN chmod +x /usr/bin/install-grails
RUN /usr/bin/install-grails

# Expose ports
EXPOSE 80

# Set the default command to execute
# when creating a new container
CMD /usr/bin/start-server