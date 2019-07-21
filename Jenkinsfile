 using hostname.

[code language="java"]
node {

    withMaven(maven:'maven') {

        stage('Checkout') {
            git url: 'https://github.com/SyCode7/account-service-jenkins.git', credentialsId: 'sycide7 github creds', branch: 'master'
        }

        stage('Build') {
            sh 'mvn clean install'

            def pom = readMavenPom file:'pom.xml'
            print pom.version
            env.version = pom.version
        }

        stage('Image') {
            dir ('account-service-jenkins') {
                def app = docker.build "localhost:5000/account-service-jenkins:${env.version}"
                app.push()
            }
        }

        stage ('Run') {
            docker.image("localhost:5000/account-service-jenkins:${env.version}").run('-p 2222:2222 -h account --name account --link discovery')
        }

           

    }

}