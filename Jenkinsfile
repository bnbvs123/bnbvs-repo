pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    def imageName = "h3xbar/bnbvs-repo"
                    def imageTag = "v3"

                    // Build the Docker image
                    docker.build(imageName + ":" + imageTag, "-f .")
                }
            }
        }

        stage('Push') {
            steps {
                script {
                    def dockerHubCredentials = 'docker-hub-credentials'
                    def imageName = "<your-docker-image-name>"
                    def imageTag = "<your-docker-image-tag>"

                    // Push the Docker image to the registry
                    docker.withRegistry("<your-docker-registry-url>", dockerHubCredentials) {
                        docker.image(imageName + ":" + imageTag).push()
                    }
                }
            }
        }
    }
}
