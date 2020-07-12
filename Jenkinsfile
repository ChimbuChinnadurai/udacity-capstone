pipeline {
    agent any
    
    parameters {
      string defaultValue: '', description: 'Version to be build deployed', name: 'VERSION', trim: true       
    }

    stages {
        stage("checkoutApp") {
            steps {
                script {
                 	deleteDir()
                 	sh "git clone https://github.com/ChimbuChinnadurai/udacity-capstone.git"
                }
            }
        }
        stage("Lint Dockerfile") {
            steps {
                script {
                 	sh "hadolint ./udacity-capstone/hello-app/Dockerfile"
                }
            }
        }
        stage("Build and Push App") {
            steps {
                script {
                	withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: "CHIMBU_DOCKER_CREDENTIALS", usernameVariable: "DOCKER_HUB_USERNAME", passwordVariable: "DOCKER_HUB_PASSWORD"]]) {
                		withEnv(["VERSION=${VERSION}"]){
                 			sh '''
                    			cd ./udacity-capstone/hello-app/
                    			docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_PASSWORD}
                 				./run_docker_build_push.sh $VERSION
                 			'''
             			}
         			}
                }
            }
        }
        stage("Deploy App to K8S") {
            steps {
                script {
                	withAwsCli(credentialsId: "aws-access-sandbox", defaultRegion: "eu-west-1") {
                		withEnv(["VERSION=${VERSION}"]){
                 			sh '''
                 			    cd ./udacity-capstone/hello-app/
                 			    aws eks update-kubeconfig --name chimbu-sandbox-eks
                 				helm upgrade --install capstone ./charts/capstone --namespace capstone --values ./charts/capstone/values.yaml --set deployment.image.repository=simbu1290/capstone --set deployment.image.tag=$VERSION --debug
                 			'''
             			}
         			}
                }
            }
        }
    }
}
