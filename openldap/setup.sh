#!/bin/bash

# Create ldap server
docker run -v /data/ldap:/var/lib/ldap \
           -e LDAP_DOMAIN=meldrum.com \
           -e LDAP_ORGANISATION="Meldrum Gerrit" \
           -e LDAP_ROOTPASS=meldrum \
           -d nickstenning/slapd

