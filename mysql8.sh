#!/bin/sh

read -p "Remove stack? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	docker stack rm mysql8

	until docker stack rm mysql8
	do
		sleep 1
	done
fi



echo ""
read -p "Pull? " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then
	docker pull mysql:latest
fi



echo ""
read -p "Deploy? " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then
	docker stack deploy --compose-file ./mysql8/stack.yml mysql8
	sleep 2
	docker service ls
fi
