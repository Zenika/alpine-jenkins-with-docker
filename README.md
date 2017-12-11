# alpine-jenkins-with-docker

Minimal Jenkins Docker Images built on Alpine Linux

## How to

Launch the container using the following command:
```
docker run -e JENKINS_INSTALL=$(pwd) -ti -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 -p 50000:50000 -v $(pwd)/var/jenkins_home:/var/jenkins_home zenika/alpine-jenkins-with-docker
```

## Why $JENKINS_INSTALL?

It's needed to call docker using the host docker engine and set the correct absolute path:
```
pipeline {
    agent any

    stages {
        stage('lint') {
            steps {
                sh 'printenv'
                sh 'docker run -v $JENKINS_INSTALL$PWD:/usr/src/app zenika/alpine-node yarn'
                sh 'docker run -e CI=true -v $JENKINS_INSTALL$PWD:/usr/src/app zenika/alpine-node yarn test'
            }
        }
        stage('build') {
            steps {
                sh 'docker run -e CI=true -v $JENKINS_INSTALL$PWD:/usr/src/app zenika/alpine-node yarn build'
            }
        }
        stage('deploy') {
            steps {
                sh 'docker build -t local/application:${BRANCH_NAME} $JENKINS_INSTALL$PWD'
                sh 'docker-compose -p ${BRANCH_NAME}-demo up -d'
            }
        }
    }
}
```
