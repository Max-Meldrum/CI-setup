#!/bin/bash

# Warning, this will delete the containers and the ldap data.

sudo rm -rf /data/ldap


postgresid=$(docker ps | grep postgres | awk '{print $1}')

sudo docker stop "$postgresid"
sudo docker rm "$postgresid"


gerritid=$(docker ps | grep openfrontier/gerrit | awk '{print $1}')

sudo docker stop "$gerritid"
sudo docker rm "$gerritid"





