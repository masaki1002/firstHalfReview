FROM python:3.7-alpine
MAINTAINER Egota puchi

ENV PYTHONUNBUFFRED 1

COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
      gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

RUN mkdir /appli
WORKDIR /appli
COPY ./appli /appli

RUN adduser -D user
USER user
