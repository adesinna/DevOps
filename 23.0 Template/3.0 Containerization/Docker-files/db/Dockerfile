FROM mysql:8.0.33
LABEL "Project"="Vprofile"
LABEL "Author"="Adesina"

ENV MYSQL_ROOT_PASSWORD="vprodbpass" # password
ENV MYSQL_DATABASE="accounts" # build the database


ADD db_backup.sql docker-entrypoint-initdb.d/db_backup.sql