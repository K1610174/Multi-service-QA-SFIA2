pipeline {
    agent any
    stages {
        stage("Build App") {
            steps {
		sh 'chmod +x ./scripts/*.sh'
                sh "./scripts/build_app.sh"
            }
        }
        
        stage("Test App") {
            steps {
                sh "./scripts/test_app.sh"
            }
        }

        stage("Deploy App") {
            steps {
                sh "./scripts/deploy_app.sh"
            }
        }
    }
}
