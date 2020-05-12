#!/bin/sh

read -p "Remove stack? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	docker stack rm mariadb

	until docker stack rm mariadb
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
	docker pull mariadb:latest
fi



echo ""
read -p "Deploy? " -n 1 -r
echo ""
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then
	docker stack deploy --compose-file ./mariadb/stack.yml mariadb
	sleep 2
	docker service ls
fi
