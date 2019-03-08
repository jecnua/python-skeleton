FROM python:3.6

RUN pip3 install pipenv==2018.11.26

WORKDIR /usr/src/app

COPY Pipfile ./
COPY Pipfile.lock ./

RUN set -ex && pipenv install --deploy --system

COPY . .

ENV FLASK_APP 'src/app.py'

EXPOSE 80

CMD [ "flask", "run", "--host=0.0.0.0", "--port=80"]
