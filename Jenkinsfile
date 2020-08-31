pipeline {
    agent any
    environment{
        MYSQL_DB=credentials('MYSQL_DB')
        MYSQL_ROOT_PASSWORD=credentials('MYSQL_ROOT_PASSWORD')
        TEST_DB=credentials('TEST_DB')

    }
    stages {
        stage("Build App") {
            steps {
		        sh "chmod +x ./scripts/*.sh"
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
