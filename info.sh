
#! /bin/sh -e

TARGET_PATH=$1

if [[ ! -d $TARGET_PATH ]]; then
	echo "Please input directory!!"
	exit 0
fi

APP_PATH=`find $TARGET_PATH -a -name "*.app" |head -1`

if [[ -d $APP_PATH ]]; then
	echo "=====================info checking=========================="
	if `grep -R -a -C3 "aps-environment" $APP_PATH |grep "production" >/dev/null` && `grep -R -a -C3 "get-task-allow" $APP_PATH | grep "false" >/dev/null`; then
		echo "success"
	else
		echo "fail"
	fi
	echo "=====================checking is done=========================="
fi
