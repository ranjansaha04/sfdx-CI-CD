#!groovy

import groovy.json.JsonSlurperClassic

node {
def SF_CONSUMER_KEY=env.SF_CONSUMER_KEY
    def SF_USERNAME=env.SF_USERNAME
    def SERVER_KEY_CREDENTALS_ID=env.SERVER_KEY_CREDENTALS_ID
    def TEST_LEVEL='RunLocalTests'
    
    def SF_INSTANCE_URL = env.SF_INSTANCE_URL ?: "https://login.salesforce.com"
	def DEFAULT_FOLDER_PATH = "force-app/main/default"
    def toolbelt = tool 'toolbelt'
    
    // -------------------------------------------------------------------------
    // Check out code from source control.
    // -------------------------------------------------------------------------

    stage('checkout source') {
        checkout scm
    }
    
     withCredentials([file(credentialsId: SERVER_KEY_CREDENTALS_ID, variable: 'server_key_file')]) {
       // -------------------------------------------------------------------------
            // Authorize the Dev Hub org with JWT key and give it an alias.
            // -------------------------------------------------------------------------

            stage('Authorize Org') {
                rc = command "${toolbelt}/sfdx force:auth:jwt:grant --instanceurl ${SF_INSTANCE_URL} --clientid ${SF_CONSUMER_KEY} --username ${SF_USERNAME} --jwtkeyfile ${server_key_file}"
                if (rc != 0) {
                    error 'Salesforce Org authorization failed.'
                }
            }
			
            stage('Validate') {
                rc = command "${toolbelt}/sfdx force:source:deploy --checkonly --sourcepath ${DEFAULT_FOLDER_PATH} --targetusername ${SF_USERNAME} --wait 100"
                if (rc != 0) {
                    error 'Validation failed.'
                }
            }
			
			stage('Deploy') {
                rc = command "${toolbelt}/sfdx force:source:deploy --sourcepath ${DEFAULT_FOLDER_PATH} --targetusername ${SF_USERNAME} --wait 100"
                if (rc != 0) {
                    error 'Deployment failed.'
                }
            }
     }
}
def command(script) {
    if (isUnix()) {
        return sh(returnStatus: true, script: script);
    } else {
        return bat(returnStatus: true, script: script);
    }
}
