#!/bin/bash

# Start DB container

docker run \
--name pg-gerrit \
-p 5432:5432 \
-e POSTGRES_USER=gerrit2 \
-e POSTGRES_PASSWORD=gerrit \
-e POSTGRES_DB=reviewdb \
-d postgres


# Run gerrit with linked Postgres container and with ldap info

docker run --name gerrit  --link pg-gerrit:db -p 8080:8080 -p 29418:29418 -e WEBURL=http://localhost:8080 -e
DATABASE_TYPE=postgresql -e AUTH_TYPE=LDAP  -e LDAP_SERVER=192.168.0.201:389 -e LDAP_USERNAME=cn=admin,dc=meldrum,dc=com
-e LDAP_PASSWORD=meldrum -e LDAP_GROUPBASE=ou=users,dc=meldrum,dc=com -e LDAP_REFERRAL=follow -e LDAP_ACCOUNTFULLNAME=cn
-e LDAP_ACCOUNTBASE=ou=users,dc=meldrum,dc=com -d openfrontier/gerrit
