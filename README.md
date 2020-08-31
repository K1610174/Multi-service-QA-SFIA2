# DEVOPS CORE PRACTICAL PROJECT

## BRIEF
### Objective
This project is the development of a multi-services application that uses a fron-end service that communicates with three other services creating an API that also interacts with a database to give the user a fortune.

### Requirements
- Kanban Board - JIRA
- Version Control System - Git
- CI Server - Jenkins
- Configuration Management - Ansible
- Cloud Server - GCP virtual machines
- Containerisation - Docker
- Orchestration Tool - Docker Swarm
- Reverse Proxy - NGINX
  
### My Approach
This application generates a fortune for the user using the four different services.
* Service one: This is the front-end service which uses Flask to show the user fortune. The user has to click the generate button on the home page and are then directed to the fortune page. It stores this information into a database. This service gets information from service two and service three and posts it to service four and then displays the result.
    
* Service two: This is a back-end service that returns a random color to service one. This is one of the results that will be used in service four.
  
* Service three: This back-end service returns a random starsign such as Scorpio to service one. This result will also be used in service four.
  
* Service four: This back-end service uses the information that has been post from service one, using combination logic to generate a fortune result that can then be displayed to the user.
  
For this product to be delivered on time I used MoSCoW analysis to prioritise my workload. 

Must have:
- Project tracking
- Service-oriented architecture
- Version Control (Feature-Branch model)
- Using Ansible
- Using a reverse proxy 
-  Containerisation tool
-  Orchestration tool
-  Testing
-  Documentation
-  CI Server
-  Risk Assessment
-  Webhook configuration to manage changes made to the code

Should have:
- A generate button to give the user a choice
- Navigation bar
  
Could have:
- Cascading Style Sheets (CSS)
  
### Database Structure

![](https://github.com/K1610174/QA-SFIA2/blob/master/images/database.PNG)

## ARCHITECTURE
### CI PIPELINE
#### Source Code
The services are written in Python using Flask micro web framework. The diagram below shows the interaction between the services and the database.

![](https://github.com/K1610174/QA-SFIA2/blob/master/images/app_structure.PNG)
 
#### Version Control System (Git)
Git and GitHub are used to as source code management and version control tools to keep track of the changes made to the code using the Feature-Branch model.
For every new feature a branch is created and when the feature is working it is merged to the master branch which is the final version of the application.

#### Containeristation
The application is containerised using Docker so that the four services and database are all running in individual containers. These containers can then be replicated to ensure the apllication is always available to the user. The services can also be stored as images on a registry such as Docker Hub. The application is built using Dcoker. The docker-compose.yaml file is what is used in this project for containerisation.

#### Orchestration Tool
Docker Swarm is the container ochestration tool used. It is used to create a cluster of the Docker containers on different nodes allowing the deployment of containers over multiple virtual machines. For this project I used one manager node and two worker nodes.

#### Configuration Management
For this project, Ansible is the configuration management tool used. Using a playbook to run the commands necessary to configure the application on the  different swarm nodes. They are configured with Docker and Swarm as well as Python.

#### Reverse Proxy
NGINX is the reverse proxy used for this project. Nginx is a web server that has several purposes such as reverse proxy, load balancer, mail proxy and others.
As a reverse proxy server it forwards the client requests to the application which improves the security and reliability. This is done by editing the nginx.conf file.

#### CI Server
Using the Jenkins pipeline project type the application uses the Jenkinsfile to build, test, and deploy it to a cloud-based virtual machine.

## PROJECT TRACKING
JIRA project management software was used to keep track of the progress of this project using a Kanban board.
![](https://github.com/K1610174/QA-SFIA2/blob/master/images/kanban_backlog.PNG)

The Kanban board has MoSCoW prioritised tasks that are split into four stages backlog, selected for development, in progress and done.
## RISK ASSESSMENT
### Initail

![](https://github.com/K1610174/QA-SFIA2/blob/master/images/inital_risk_assessment.PNG)

### Final

![](https://github.com/K1610174/QA-SFIA2/blob/master/images/final_risk_assessment.PNG)

## TESTING 
The testing for this appliaction was done using pytest.
The test coverage for service one and service four are shown below.

![](https://github.com/K1610174/QA-SFIA2/blob/master/images/service1_test_cov.PNG)

![](https://github.com/K1610174/QA-SFIA2/blob/master/images/service4_test_cov.PNG)

I initally attempted intergration tests for service one on a virtual machine but did not succeed on Jenkins.  
## FRONT-END DESIGN
##### Home Page

![](https://github.com/K1610174/QA-SFIA2/blob/master/images/home_page.PNG)

##### Fortune Page

![](https://github.com/K1610174/QA-SFIA2/blob/master/images/fortune_page.PNG)

## FUTURE IMPROVEMENTS
This is the Minimum Viable Product for the project specification. Other features can be introduced for future versions of the appplication. One of them being, getting the inputs for service two and three from the user by adding a form to service one that allow the user to enter their favorite color and their star sign.

## LICENSE
MIT LICENSE

## CONTRIBUTORS
- AMANDA KEKITINISA

## ACKNOWLEGMENTS
- QA COMMUNITY
- 20JULDEVOPS1 TEAM
- LUKE BENSON
- HARRY VOLKER