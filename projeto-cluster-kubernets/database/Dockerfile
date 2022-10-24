FROM mariadb

WORKDIR /var/lib/mysql/

ENV MYSQL_ROOT_PASSWORD=rootpasswd

ENV MYSQL_DATABASE=mydatabase

ADD cadastro.sql /docker-entrypoint-initdb.d

EXPOSE 3306
