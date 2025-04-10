#!/bin/bash

if [ $# -ne 1 -a $# -ne 2 ]; then
        echo '-c ... create'
        echo '-d ... delete'
	echo '-s <claim-name> ... add pvc'
        echo 'Usage: ./oc.sh <-c|-d>' >&2
        exit 3
fi

oc project fre-testpod
[ $? -ne 0 ] && oc new-project fre-testpod && [ $? -ne 0 ] && exit 2

case $1 in
	-c) oc new-app quay.io/jfreygner/testpod:0.3;;
	-s) oc set volume deployment/testpod --add --overwrite=true --name testpod-volume-1 --claim-name=$2;;
	-d) oc delete all -l app=testpod
            oc delete all --all
            oc delete pvc $(oc get pvc | awk '{print $1}' | grep -vi name);;
	*) echo wrong arguments
            exit 10;;
esac
