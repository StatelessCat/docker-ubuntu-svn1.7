FROM ubuntu:14.04

MAINTAINER Raphael Cazenave-Leveque<raphael.cazenave-leveque@etu.univ-lyon1.fr>
# thanks @Wauzl from http://askubuntu.com/questions/453717/i-need-downgrade-from-subversion-1-8-to-subversion-1-7

RUN \
  echo "deb http://old-releases.ubuntu.com/ubuntu/ saucy main universe restricted multiverse" >> /etc/apt/sources.list && \
  echo "deb http://extras.ubuntu.com/ubuntu saucy main" >> /etc/apt/sources.list && \
  apt-get update && apt-get clean
# Add Ubuntu saucy repositories

RUN apt-get install -y subversion=1.7.9-1+nmu6ubuntu3 libsvn1=1.7.9-1+nmu6ubuntu3 ssh && apt-get clean
# Install old Subversion, libs, and SSH

RUN \
  echo subversion hold | sudo dpkg --set-selections && \
  echo libsvn1 hold | sudo dpkg --set-selections && \
  echo libserf1 hold | sudo dpkg --set-selections && \
  apt-get upgrade -y && apt-get clean
# Mark subversion to stay at this version, and do security upgrades

RUN useradd -ms /bin/bash ubuntu
USER ubuntu

# Create a directory where you will mount your subversion projects
RUN mkdir /home/ubuntu/svnproject
WORKDIR /home/ubuntu/svnproject

