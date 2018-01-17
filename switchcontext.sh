#! /bin/sh
if [ $# -ne 0 ]; then
  echo "===> Switching cloud context ..."
  #PROJECT = $1
  #CLUSTER = $2
  #ZONE = $3

	gcloud --quiet config set project $1
	gcloud --quiet config set container/cluster $2

	# check if zone and update
	if ! [ -z $3 ]; then
		gcloud --quiet config set compute/zone $3
	fi

	# set credentials for kubectl
	gcloud container clusters get-credentials $2
	echo "===> New context ..."
	kubectl config current-context
	exit 0
else
  echo "Usage: switchcontext.sh PROJECT CLUSTER [ZONE]"
fi

