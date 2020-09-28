# Docker Jenkins Slave

First of all download slave.jar on your own Jenkins instance with below command;
- JENKINS_URL/jnlpJars/slave.jar

You need to make sure that you have a slave.jar on the current path! We will copy this jar with the specific name(**slave.jar**) into the image.

Create an agent with the following Launch method, **"Launch agent by connecting it to the master"**. After that you can run sh command below and build your own slave image and run it.

**ps: Please fill "JENKINS_URL" and "SECRET" variables inside docker-entrypoint.sh file properly.**

```sh
export CHROME_VERSION=83.0.4103.97-1
export FIREFOX_VERSION=74.0b6
```

Build your Jenkins Slave on Docker. ready and up!
- docker build --no-cache --build-arg CHROME_VERSION=$CHROME_VERSION --build-arg FIREFOX_VERSION=$FIREFOX_VERSION -t necatikcbs/docker-jenkins-slave:1.0 .