#!/bin/bash

cd $(dirname $0)
if [ $# -lt 1 ];then
	echo "Usage: $0 <pid>..."
	exit
fi

for p in $*
do
	pu=$(ps -fp $p |grep $p |awk '{print $1}')
	if [ `whoami` != $pu ];then
		echo "当前用户不是 pid:$p 的运行用户，请切换到相应用户执行"
		ps -fp $p
		continue
	fi
    java -jar Loader.jar $p
done
