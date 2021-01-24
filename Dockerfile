FROM gradle:6.6.1-jdk8


ENV ANDROID_SDK_ROOT=/usr/lib/android-sdk
ENV ANDROID_HOME=/usr/lib/android-sdk


RUN apt update
RUN apt upgrade -y
RUN apt install curl git build-essential android-sdk* -y


RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt update
RUN apt install nodejs -y


COPY data /usr/lib/android-sdk/


RUN echo "\n\nexport PATH=$ANDROID_HOME/cmdline-tools/tools/bin:$PATH" >> /etc/bash.bashrc
RUN yes | /usr/lib/android-sdk/cmdline-tools/tools/bin/sdkmanager --licenses


RUN npm i -g vue-cli
RUN npm i -g cordova
