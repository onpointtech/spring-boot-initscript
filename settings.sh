 #!/bin/bash
#
# Startup script for a spring boot project
#
# chkconfig: - 84 16
# description: spring boot project

# Source function library.
[ -f "/etc/rc.d/init.d/functions" ] && . /etc/rc.d/init.d/functions
[ -z "$JAVA_HOME" -a -x /etc/profile.d/java.sh ] && . /etc/profile.d/java.sh


# the name of the project, will also be used for the war file, log file, ...
PROJECT_NAME=springboot
# the user which should run the service
SERVICE_USER=root
# base directory for the spring boot jar
SPRINGBOOTAPP_HOME=/usr/local/$PROJECT_NAME
export SPRINGBOOTAPP_HOME

# the spring boot jar-file
SPRINGBOOTAPP_JAR="$SPRINGBOOTAPP_HOME/$PROJECT_NAME.jar"

# java executable for spring boot app, change if you have multiple jdks installed
SPRINGBOOTAPP_JAVA=$JAVA_HOME/bin/java

# spring boot log-file
LOG="/var/log/$PROJECT_NAME/$PROJECT_NAME.log"

LOCK="/var/lock/subsys/$PROJECT_NAME"

RETVAL=0