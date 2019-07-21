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
           sh 'docker build -t localhost:5000/account-service-jenkins .'
           sh 'docker push -t localhost:5000/account-service-jenkins'
        }

        stage ('Run') {
           sh 'docker run -p 2222:2222 -d localhost:5000/account-service-jenkins '
        }

           

    }

}
