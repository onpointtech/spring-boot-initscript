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

## Find the last line number for the logfile
[ -e "$LOG" ] && cnt=`wc -l "$LOG" | awk '{ print $1 }'` || cnt=1

echo $"Starting $PROJECT_NAME... "

cd "$SPRINGBOOTAPP_HOME"
sudo nohup $SPRINGBOOTAPP_JAVA -jar $SPRINGBOOTAPP_JAR  >> $LOG 2>&1 &

## Pause so that the process has a chance to start
sleep 3

## As long as the process started, keep checking the log file to know when it's fully started
while { pid_of_spring_boot > /dev/null ; } &&
    ! { tail --lines=+$cnt "$LOG" | grep -E ' Started \S+ in' > /dev/null ; } ; do
		sleep 1
done

echo "Startup complete"