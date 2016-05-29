Continuous Integration setup using Gerrit and Jenkins
=====================================================

The following was done on a Ubuntu server 14.04.4. At this point the setup is only meant to remind me how i set everything up. When i get more used to the environment i will make a more detailed guide.


=================
Setting up gerrit
=================

Update system::

	sudo apt-get update

Install java::

	sudo apt-get install default-jdk

Install git::
	
	sudo apt-get install git


**In this setup, PostgreSQL was used as the database for gerrit**

Install postgresql::

	sudo apt-get install postgresql postgresql-contrib

Create a gerrit database user::

	useradd gerrit2
	passwd gerrit2

Create database etc..::

	su - postgres
	CREATE USER gerrit2 WITH PASSWORD 'gerrit2';
	CREATE DATABASE reviewdb;
	GRANT ALL PRIVILEGES ON DATABASE reviewdb to gerrit2;


Create a non root user for gerrit::

	sudo useradd -d /opt/gerrit gerrit
	sudo chown -R gerrit:gerrit /opt/gerrit
	
	# Set password
	passwd gerrit

Download the gerrit war file::

	cd /opt/gerrit/
	wget https://www.gerritcodereview.com/download/gerrit-2.12.2.war

Init gerrit::

	java -jar gerrit-2.12.2.war init

	# My setup below

	[gerrit]
	basePath = git
	canonicalWebUrl = http://127.0.0.1:8080/
	[database]
		type = postgresql
		hostname = localhost
		database = reviewdb
		username = gerrit2
	[index]
		type = LUCENE
	[auth]
		type = LDAP
	[ldap]
		server = ldap://localhost:389
		username = cn=admin,dc=meldrum,dc=com
		password = meldrum
		accountBase = ou=users,dc=meldrum,dc=com
		groupBase = ou=users,dc=meldrum,dc=com
		referral = follow
		accountFullName = cn
	[receive]
		enableSignedPush = false
	[sendemail]
		smtpServer = localhost
	[container]
		user = gerrit
		javaHome = /usr/lib/jvm/java-7-openjdk-amd64/jre
	[sshd]
		listenAddress = *:29418
	[httpd]
		listenUrl = proxy-https://127.0.0.1:8080/
	[cache]
		directory = cache



	

	

	


