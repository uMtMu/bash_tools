#!/bin/bash
#sys_watch_checker.sh
#make sure a process is always running.

export DISPLAY=:0 #needed if you are running a simple gui app.

process="${1:-auditd}"
service="${2:-auditd}"
makerun="${3:-/sbin/auditd}"
grep_key"${4:-runnig}"
EMAIL="umut.cakir@sonteklif.com"

if ps ax | grep -v grep | grep -w $process > /dev/null
then
        echo "$process process is working.."
else
        process="audit"
        subject="Subject:$process is down"
        to="To:umut.cakir@sonteklif.com"
        from="From:alert@sonteklif.com"
        body="$process is down. Trying to restart $process.."
        echo -e "$to\n$from\n$subject\n$body" | sendmail -t $to

        $makerun &
fi

if service $service status | grep $grep_key > /dev/null
then
        echo "$service service is running"
else
        subject="Subject:$service is down"
        to="To:umut.cakir@sonteklif.com"
        from="From:alert@sonteklif.com"
        body="$service is down. Trying to restart $service.."
        echo -e "$to\n$from\n$subject\n$body" | sendmail -t $to

        service $service restart
fi

exit
