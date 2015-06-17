Spring Boot start/stop scripts
=========================

These scripts are meant to start/stop a spring-boot project on a linux system.

It is meant as a template that can be reconfigured to an arbitrary jar file. 

Use the variable names in the settings.sh file to customize to your specific project.

Parameter | Description | Default Value
----------| ----------- | ----------
`PROJECT_NAME` | the name of the project, will also be used for the war file, log file, ... | `springboot`
`SERVICE_USER` | the user which should run the service | `root`
`SPRINGBOOTAPP_HOME` | base directory for the spring boot jar |  `/usr/local/$PROJECT_NAME`
`SPRINGBOOTAPP_JAR` | the jar/war file to start via `java -jar` | `$SPRINGBOOTAPP_HOME/$PROJECT_NAME.jar`
`SPRINGBOOTAPP_JAVA` | java executable for spring boot app, change if you have multiple jdks installed | `$JAVA_HOME/bin/java`
