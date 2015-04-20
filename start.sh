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

[ -e "$LOG" ] && cnt=`wc -l "$LOG" | awk '{ print $1 }'` || cnt=1

echo -n $"Starting $PROJECT_NAME: "

cd "$SPRINGBOOTAPP_HOME"
su $SERVICE_USER -c "nohup $SPRINGBOOTAPP_JAVA -jar \"$SPRINGBOOTAPP_JAR\"  >> \"$LOG\" 2>&1 &"

while { pid_of_spring_boot > /dev/null ; } &&
    ! { tail --lines=+$cnt "$LOG" | grep -q ' Started \S+ in' ; } ; do
		sleep 1
done

pid_of_spring_boot > /dev/null
RETVAL=$?
[ $RETVAL = 0 ] && success $"$STRING" || failure $"$STRING"
echo

[ $RETVAL = 0 ] && touch "$LOCK"