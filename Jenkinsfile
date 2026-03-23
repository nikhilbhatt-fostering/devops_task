pipeline {
    agent any

    triggers {
        githubPush()
    }

    environment {
        ANSIBLE_HOST_KEY_CHECKING = 'False'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Deploy via Ansible') {
            steps {
                sh '''
                    ansible-playbook -i /home/nikhil/ansible/inventory.ini \
                    /home/nikhil/ansible/newdeploy.yml
                '''
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
```

---

**GitHub Webhook:**
```
URL:          http://192.168.123.109:8080/github-webhook/
Content type: application/json
Event:        Just the push event
Secret:       (leave empty for now)
```

Go here to add it:
```
https://github.com/nikhilbhatt-fostering/devops_task/settings/hooks/new
```

---

**Jenkins job config:**
```
GitHub project URL:  https://github.com/nikhilbhatt-fostering/devops_task
Repo SSH URL:        git@github.com:nikhilbhatt-fostering/devops_task.git
Branch:              */main
Script Path:         Jenkinsfile
