# NOTES


## POSTGRESQL

You can stop start restart and check the status of postgres using the systemctl command 

for example: systemctl status postgresql

### Logging into the postgres account as superuser
sudo -i -u postgres
psql

It is recommended to not modify the postgres user see [ here ](https://stackoverflow.com/questions/2172569/how-do-i-login-and-authenticate-to-postgresql-after-a-fresh-install) for more information.

It is a better practice to make your linux user account a superuser for postgres: sudo -u postgres createuser --superuser $USER 

### Creating new users 

As a superuser in the psql shell: 
CREATE ROLE user LOGIN PASSWORD 'pass';

### Creating new databases 
As a superuser in the psql shell: 
CREATE DATABASE dbname WITH OWNER = user;

or from terminal if the user account was made a superuser: createdb dbname

You can then login to the database via: psql -d dbname

### Finding the postgres port
In the psql shell: 
SHOW port;

### Logging in to a database 
locally you can do psql -d dbname or 
psql -h localhost -d dbname -U user -p port;
you can change localhost to the remote dn if you are trying to connect remotely

### Commands for psql
\q to quit
\du to display users 


