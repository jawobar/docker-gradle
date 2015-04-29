#
# Gradle image based on Oracle JRE 8
#

FROM 1science/java:oracle-jre-8
MAINTAINER 1science Devops Team <devops@1science.org>

ENV IVY_HOME /cache
ENV GRADLE_VERSION 2.3
ENV GRADLE_HOME /usr/local/gradle
ENV PATH ${PATH}:${GRADLE_HOME}/bin

# Install gradle
WORKDIR /usr/local
RUN wget  https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip && \
    unzip gradle-$GRADLE_VERSION-bin.zip && \
    rm -f gradle-$GRADLE_VERSION-bin.zip && \
    ln -s gradle-$GRADLE_VERSION gradle && \
    echo -ne "- with Gradle $GRADLE_VERSION\n" >> /root/.built

WORKDIR /app