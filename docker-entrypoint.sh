#!/bin/bash

set -e

JENKINS_URL=<write-your-jenkins-instance-url-here>
SECRET=<agent-secret>

umask u+rxw,g+rwx,o-rwx

/usr/local/openjdk-8/bin/java -jar /opt/slave.jar -jnlpUrl $JENKINS_URL/computer/DockerSdkAgent/slave-agent.jnlp -secret $SECRET

exec "$@"
