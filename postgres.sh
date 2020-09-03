#!/bin/sh

read -p "Remove stack? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	docker stack rm postgres

	until docker stack rm postgres
	do
		sleep 1
	done
fi



echo ""
read -p "Pull? " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then
	docker pull postgres:latest
fi



echo ""
read -p "Deploy? " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then
	docker stack deploy --compose-file ./postgres/stack.yml postgres
	sleep 2
	docker service ls
fi
