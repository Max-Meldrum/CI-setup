#!/bin/bash

# Create ldap server
docker run -v /data/ldap:/var/lib/ldap -e LDAP_DOMAIN=meldrum.com -e LDAP_ORGANIZATION="Meldrum Gerrit" \-e LDAP_ROOTPASS=meldrum --name ldap -p 389:389 -d nickstenning/slapd


