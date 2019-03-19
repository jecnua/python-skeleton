FROM python:3.6

RUN pip3 install pipenv==2018.11.26

WORKDIR /usr/src/app

COPY Pipfile ./
COPY Pipfile.lock ./
COPY src src
COPY Dockerfile /Dockerfile

RUN set -ex && pipenv install --deploy --system

EXPOSE 80
WORKDIR /usr/src/app/src
ENV FLASK_APP 'src/app.py'
CMD ["gunicorn","--workers=2","--bind=0.0.0.0:80","--log-level=info","app:app"]

ARG BUILD_DATE
ARG VERSION
ARG VCS_URL
ARG VCS_REF

LABEL maintainer="jecnua <fabrizio.sabatini.it@gmail.com>" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.name="Flask demo" \
  org.label-schema.description="A flask demo" \
  org.label-schema.vcs-url=$VCS_URL \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.version=$VERSION \
  org.label-schema.url="" \
  org.label-schema.schema-version="1.0" \
  com.jecnua.docker.dockerfile="/Dockerfile" \
  com.jecnua.license="MIT"
