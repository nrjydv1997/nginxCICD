@Library("Nginx-shared-lib") _
pipeline {
    agent {label 'vinod'}

    stages {
        stage('Hello') {
            steps {
                script {
                    hello()
                }
            }
        }
        stage('Git Clone') {
            steps {
                clone("https://github.com/nrjydv1997/nginxCICD.git","main")
            }
        }
        stage('Build Image') {
            steps {
                echo 'Image is building..'
                script{
                   docker_build("notest-app","latest","nrjydv1997") 
                }
            }
        }
        stage('Push Image') {
            steps {
                echo 'Image Push'
                docker_push("notest-app","latest","nrjydv1997") 
            }
        }
        stage('Deploy') {
    steps {
        echo 'Image is deploying...'
        withCredentials([string(credentialsId: 'dockerRepo', variable: 'dockerRepo')]) {
            script {
                // Stop and remove existing container if already running (optional)
                sh """
                    docker rm -f nginx-app-${env.JOB_NAME} || true
                    docker run -d --name nginx-app-${env.JOB_NAME} -p 8000:80 ${dockerRepo}/nginx-app:latest
                """
            }
        }
    }
}

    }
}
