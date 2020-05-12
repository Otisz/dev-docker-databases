#!/bin/sh

read -p "Remove stack? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	docker stack rm redis

	until docker stack rm redis
	do
		sleep 1
	done
fi



echo ""
read -p "Pull? " -n 1 -r
echo ""
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then
	docker pull redis:alpine
fi



echo ""
read -p "Deploy? " -n 1 -r
echo ""
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then
	docker stack deploy --compose-file ./redis/stack.yml redis
	sleep 2
	docker service ls
fi
