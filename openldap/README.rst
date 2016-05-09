Setting up OpenLDAP server
==========================

First run the setup script.

**For the commands below, authenticate with the ROOTPASS which in this setup is meldrum as default**


Add ou Users::

    # base.ldif contains the ou information
    ldapadd -v -h localhost:389 -c -x -D cn=admin,dc=meldrum,dc=com -W -f base.ldif

Add User::

    ldapadd -v -h localhost:389 -c -x -D cn=admin,dc=meldrum,dc=com -W -f users.ldif

Change password of user::
    
    # Password will be set to "pass"
    ldappasswd -v -h localhost:389 -s pass -W -D "cn=admin,dc=meldrum,dc=com" -x "uid=maxm,ou=users,dc=meldrum,dc=com"

