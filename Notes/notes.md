# NOTES


## POSTGRESQL

You can stop start restart and check the status of postgres using the systemctl command 

for example: systemctl status postgresql

### Logging into the postgres account
sudo -i -u postgres
psql

It is recommended to not modify the postgres user see [ here ](https://stackoverflow.com/questions/2172569/how-do-i-login-and-authenticate-to-postgresql-after-a-fresh-install) for more information.
