# Postgresql

### Useful links

[official download](https://wiki.postgresql.org/wiki/Apt)

[starting DB server | official postgres12](https://www.postgresql.org/docs/12/server-start.html)

### installations

[Install PostgreSQL 14 in Ubuntu](https://www.linuxshelltips.com/install-postgresql-in-ubuntu/)

[Install pgAdmin in Ubuntu](https://www.pgadmin.org/download/pgadmin-4-apt/)

### django

[connect Postgres with django](https://studygyaan.com/django/how-to-connect-postgresql-database-in-django-project)

### Useful tutos

[connect to PostgreSQL](https://phoenixnap.com/kb/how-to-connect-postgresql-database-command-line)

[Change PostgreSQL Authentication Method from Ident to MD5](https://www.liquidweb.com/kb/change-postgresql-authentication-method-from-ident-to-md5/)

##### pgAdmin4 (package for GUI db connection)

[connect pgAdmin4 to PostgreSQL db](https://stackoverflow.com/questions/41873779/connection-with-my-db-using-pgadmin4)

[connect, create a db and a table](https://thedbadmin.com/how-to-connect-postgresql-database-from-pgadmin/) (good, fast)

### Install process

See [Install PostgreSQL 14 in Ubuntu](https://www.linuxshelltips.com/install-postgresql-in-ubuntu/) and [Install pgAdmin in Ubuntu](https://www.pgadmin.org/download/pgadmin-4-apt/) for all info.

1. Install Postgres. Start by adding the signing key and PPA, then install package. The current latest LTS package is `postgresql-14`.
2. Setup Postgres. `systemctl enable` to make Postgres start after reboot. Don't forget to set a password for the default `postgres` user. See section below.
3. Install pgAdmin. Get key and PPA then install. Setup a master keyword and also provide the password of the `postgres` user.


### Commands

##### start db server

`pg_ctlcluster 12 main start` : start Postgres. Not the recommended way.

`sudo systemctl start postgresql@12-main` : start Postgres with `systemctl`.

##### get version

```shell
(base)  ❮ onyr ★  kenzae❯ ❮ ~❯❯ locate bin/postgres
/usr/lib/postgresql/12/bin/postgres
(base)  ❮ onyr ★  kenzae❯ ❮ ~❯❯ /usr/lib/postgresql/12/bin/postgres -V
postgres (PostgreSQL) 12.12 (Ubuntu 12.12-1.pgdg20.04+1)
```

##### quick connect to db server

`pgadmin4` : launch `pgAdmin4`, GUI interaction with the db server.

`sudo su postgres`, then `psql`, or `sudo -u postgres psql` directly : changer d'utilisateur pour l'utilisateur. Avec `sudo `, utiliser le mdp de l'user en cours. Sans le `sudo `, utiliser le mdp de l'user `postgre`. La commande `psql` lance la connection par CLI à la db PostgreSQL.

##### connect to db

**default connection process :**

From [this tuto](https://www.liquidweb.com/kb/what-is-the-default-password-for-postgresql/). The first question many ask is, **“What is the default password for the user postgres?”** The answer is easy… there isn’t a default password. The default authentication mode for PostgreSQL is set to **ident**. **What is the ident authentication method?** Well, it works
by taking the OS username you’re operating as and comparing it with the allowed database username(s). There is optional username mapping. This means that in order to connect to PostgreSQL you must be logged in as the correct OS user.

[Installing PostgreSQL](https://phoenixnap.com/kb/how-to-install-postgresql-on-ubuntu) creates a default database and user account, both called *‘postgres.’*

`sudo su postgres` : change current user to `postgres`

`psql` : when you are the `prostgres` user, connect to the db cli.

```shell
 ❮ onyr ★  kenzae❯ ❮ ~❯❯ sudo su postgres
postgres@kenzae:/home/onyr$ psql
psql (12.5 (Ubuntu 12.5-1.pgdg18.04+1))
Type "help" for help.

postgres-# \conninfo
You are connected to database "postgres" as user "postgres" via socket in "/var/run/postgresql" at port "5432".

```

**change postgres unix user password :**

I don't know why but I didn't know the password for the newly created `postgres` user. I had to change its password manually with `root` access.

`sudo passwd postgres` : change password for user `postgres`. this command must be done from a user with `sudo` access, namely users in the `sudoers` file.

`su postgres` : change current user to `postgres` user. Use the `postgres` user password.

```shell
 ❮ onyr ★  kenzae❯ ❮ ~❯❯ su postgres
Password: 
postgres@kenzae:/home/onyr$
```

**change/set password for postgres db user :**

> **WARN :** The db user and the UNIX user both have the name `postgres` but the designate two different things.

`\password` : change/set the password for the default `postgres` db user. This works a a command in the postgres `psql` cli. You need to connect to this cli first to use this command.

```shell
 ❮ onyr ★  kenzae❯ ❮ ~❯❯ sudo su postgres
[sudo] password for onyr: 
Sorry, try again.
[sudo] password for onyr: 
postgres@kenzae:/home/onyr$ psql
psql (12.5 (Ubuntu 12.5-1.pgdg18.04+1))
Type "help" for help.

postgres=# \password
Enter new password: 
```

**connect via GUI pgAdmin4 :**

Fisrt, you need a password for the user `postgres`.

> **WARN :** This is a different password that the one for the UNIX user. It is the password associated to a user in the db itself.

### Packages

| postgresql-client-12 | client libraries and client binaries |
| - | - |
| postgresql-12 | core database server |
| postgresql-contrib-9.x | additional supplied modules (part of the postgresql-xx package in version 10 and later) |
| libpq-dev | libraries and headers for C language frontend development |
| postgresql-server-dev-12 | libraries and headers for C language backend development |
| pgadmin4 | pgAdmin 4 graphical administration utility |


## Postgres CLI

### show databases

`\l`: show databases nicely in terminal.

`select * from pg_database;`: show databases using SQL query.

`\du`: show users and their associated rights


