pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage('Prepare Configuration') {
            steps {
                // Provide managed configuration files
                configFileProvider([configFile(fileId: '67b403ff-7551-497d-9315-170e60a046cf', targetLocation: 'settings.php'),
                                    configFile(fileId: 'e1ca3ee2-cab7-4354-b381-14b9815b80bf', targetLocation: 'services.yml')]) {
                    // Now the files 'settings.php' and 'services.yml' are in the workspace
                }
            }
        }
        stage('cat ') {
            steps {
               sh 'cat settings.php'
                sh 'cat services.yml'
                }
            }
        }
    }
}
