FROM postgres:latest


ENV POSTGRES_USER usr
ENV POSTGRES_PASSWORD psw
ENV POSTGRES_DB demoDB


COPY dump.sql /docker-entrypoint-initdb/