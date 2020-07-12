pipeline {
    agent {
        label 'aws-deploy-slave'
    }
    
    parameters {
      string defaultValue: '', description: 'Version to be build deployed', name: 'VERSION', trim: true       
    }

    stages {
        stage("checkoutApp") {
            steps {
                script {
                 sh "git clone https://github.com/ChimbuChinnadurai/udacity-capstone.git"
                }
            }
        }
        stage("Build and Push App") {
            steps {
                script {
                 sh '''
                    cd ./udacity-capstone/hello-app/
                 	./run_docker_build_push.sh
                 '''
                }
            }
        }
    }
}