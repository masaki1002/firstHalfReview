FROM python:3.7-alpine
MAINTAINER Egota puchi

ENV PYTHONUNBUFFRED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /appli
WORKDIR /appli
COPY ./appli /appli

RUN adduser -D user
USER user
