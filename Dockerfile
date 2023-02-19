FROM python:3.9-alpine3.13
LABEL maintainer="neriomoranp@gmail.com"

ENV PYTHONNUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./dockerfile_run.sh /tmp/dockerfile_run.sh 
RUN chmod +x /tmp/dockerfile_run.sh 

COPY ./app /app
WORKDIR /app

EXPOSE 8000

ARG DEV=false
ENV DEV=$DEV 

RUN echo "Development Environment: $DEV"
RUN sh "/tmp/dockerfile_run.sh"

ENV PATH="/py/bin:$PATH"

USER django-user