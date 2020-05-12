#!/bin/sh

read -p "Remove stack? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	docker stack rm mongodb

	until docker stack rm mongodb
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
	docker pull mongo:latest
fi



echo ""
read -p "Deploy? " -n 1 -r
echo ""
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then
	docker stack deploy --compose-file ./mongodb/stack.yml mongodb
	sleep 2
	docker service ls
fi
