
#! /bin/sh -e

TARGET_PATH=$1

if [[ ! -d $TARGET_PATH ]]; then
	suffix=${TARGET_PATH##*.}
	if [[ "$suffix" == "ipa" ]]; then
		TMP_PATH="/var/tmp/txxt"
		if [[ -d $TMP_PATH ]]; then
			rm -rf $TMP_PATH
		fi
		mkdir $TMP_PATH
		unzip -q $TARGET_PATH -d $TMP_PATH
		TARGET_PATH=$TMP_PATH
	else
		echo "Your file is not a ipa file"
		exit 0
	fi
fi
echo "target path is $TARGET_PATH"
APP_PATH=`find $TARGET_PATH -a -name "*.app" |head -1`

if [[ -d $APP_PATH ]]; then
	echo "=====================info checking=========================="
	echo "=====================checking aps-environment=========================="
	if `grep -R -a -C3 "aps-environment" $APP_PATH |grep "production" >/dev/null`; then
		echo "aps-environment pass"
	else
		echo "aps-environment fail"
	fi

	echo "=====================check aps-environment FINISH=========================="

	echo "=====================checking get-task-allow=========================="
	if `grep -R -a -C3 "get-task-allow" $APP_PATH | grep "false" >/dev/null`; then
		echo "get-task-allow pass"
	else
		echo "get-task-allow fail"
	fi

	echo "=====================check get-task-allow FINISH=========================="

	if `grep -R -a -C3 "aps-environment" $APP_PATH |grep "production" >/dev/null` && `grep -R -a -C3 "get-task-allow" $APP_PATH | grep "false" >/dev/null`; then
		echo "success"
	else
		echo "fail"
	fi
	echo "=====================checking is done=========================="
fi
