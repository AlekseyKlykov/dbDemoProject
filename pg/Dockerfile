
FROM postgres:13

COPY dump.sql /docker-entrypoint-initdb.d/


ENV POSTGRES_USER=usr
ENV POSTGRES_PASSWORD=pwd
ENV POSTGRES_DB=demoDb

EXPOSE 5432

