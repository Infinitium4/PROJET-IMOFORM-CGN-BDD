FROM mysql:8.0

ENV MYSQL_ALLOW_EMPTY_PASSWORD=yes
ENV MYSQL_DATABASE=immoform_db

COPY mysql-init/* /docker-entrypoint-initdb.d/

EXPOSE 3306
