#! /bin/sh -e

APP_PATH=$1

if [[ ! -d $APP_PATH ]]; then
	echo "Your input is not a directory!"
	exit 0
fi

SUBFIX=${APP_PATH##*.}
echo $SUBFIX
if [[ ! $SUBFIX=="app" ]]; then
	echo "Not a valid directory"
	exit 0
fi

echo "=====Checking aps-environment====="

if `grep -R -a -C3 "aps-environment" $APP_PATH |grep "production" >/dev/null`; then
		echo "aps-environment pass"
else
	echo "aps-environment fail"
	exit 0
fi

echo "=====================checking get-task-allow=========================="
if `grep -R -a -C3 "get-task-allow" $APP_PATH | grep "false" >/dev/null`; then
	echo "get-task-allow checking pass"
else
	echo "get-task-allow checking fail"
	exit 0
fi

echo "=====================checking architecture=========================="
APP_NAME=${APP_PATH##*/}
Binary_NAME=${APP_NAME%.*}
if `lipo -info $APP_PATH/$Binary_NAME | grep "armv7 arm64" >/dev/null`; then
	echo "architecture checking pass"
else
	echo "architecture checking fail"
	exit 0
fi

echo "==============pass all checking============="

