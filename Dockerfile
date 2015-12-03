# Android development environment for drone based on Ubuntu 14.04 LTS.
# version 0.0.1

# Start with Ubuntu 14.04 LTS.
FROM ubuntu:14.04

MAINTAINER Ryan Harter <ryanjharter@gmail.com>

# Never ask for confirmations
ENV DEBIAN_FRONTEND noninteractive
RUN echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections

# First, install add-apt-repository and bzip2
RUN apt-get update
RUN apt-get -y install software-properties-common python-software-properties bzip2 unzip openssh-client git lib32stdc++6 lib32z1

# Add oracle-jdk6 to repositories
RUN add-apt-repository ppa:webupd8team/java

# Update apt
RUN apt-get update

# Install oracle-jdk7
RUN apt-get -y install oracle-java7-installer

# Install android sdk
RUN wget http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
RUN tar -xvzf android-sdk_r24.4.1-linux.tgz
RUN mv android-sdk-linux /usr/local/android-sdk
RUN rm android-sdk_r24.4.1-linux.tgz

# Install Android tools
RUN echo y | /usr/local/android-sdk/tools/android update sdk --filter platform,tool,platform-tool,extra,build-tools-23.0.2 --no-ui -a

# Environment variables
ENV ANDROID_HOME /usr/local/android-sdk
ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/platform-tools
ENV PATH $PATH:$GRADLE_HOME/bin

# Export JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

RUN gradlew
