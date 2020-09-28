FROM jenkins/slave

ARG CHROME_VERSION
ARG FIREFOX_VERSION
ENV MAVEN_REPOSITORY_MIRROR "false"
ENV JAVA_HOME /usr/local/openjdk-8

USER root

RUN echo "CHROME VERSION:$CHROME_VERSION" && \
    echo "FIREFOX VERSION:$FIREFOX_VERSION"

COPY docker-entrypoint.sh /opt/docker-entrypoint.sh
COPY slave.jar /opt/slave.jar

RUN apt-get -y update && \
    apt-get install -y bash ca-certificates curl gzip tar wget vim

RUN apt-get install -y libnss3-dev libglib2.0-0 libx11-6 libxss1 libappindicator1 libindicator7 && \
    wget --no-verbose -O /tmp/chrome.deb http://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${CHROME_VERSION}_amd64.deb && \
    apt install -y /tmp/chrome.deb && \
    rm /tmp/chrome.deb && \
    google-chrome --version
    
RUN apt-get install -y libdbus-glib-1-2 && \
    wget https://download-installer.cdn.mozilla.net/pub/firefox/releases/${FIREFOX_VERSION}/linux-x86_64/en-US/firefox-${FIREFOX_VERSION}.tar.bz2 && \
    tar xvf firefox*.tar.bz2 && \
    mv firefox/ /opt && \
    ln -s /opt/firefox/firefox /usr/bin/firefox

USER jenkins

ENTRYPOINT ["/opt/docker-entrypoint.sh"]
