 #!/bin/bash
#
# Startup script for a spring boot project
#
# chkconfig: - 84 16
# description: spring boot project

source settings.sh

pid_of_spring_boot() {
    pgrep -f "java.*$PROJECT_NAME"
}

echo "Stopping $PROJECT_NAME..."

pid=`pid_of_spring_boot`
[ -n "$pid" ] && sudo kill $pid
RETVAL=$?
cnt=10
while [ $RETVAL = 0 -a $cnt -gt 0 ] &&
	{ pid_of_spring_boot > /dev/null ; } ; do
		sleep 1
		((cnt--))
done

echo
