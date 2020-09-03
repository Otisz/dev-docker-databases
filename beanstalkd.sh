#!/bin/sh

read -p "Remove stack? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	docker stack rm beanstalkd

	until docker stack rm beanstalkd
	do
		sleep 1
	done
fi



echo ""
read -p "Pull? " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then
	docker pull schickling/beanstalkd:latest
fi



echo ""
read -p "Deploy? " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then
	docker stack deploy --compose-file ./beanstalkd/stack.yml beanstalkd
	sleep 2
	docker service ls
fi
