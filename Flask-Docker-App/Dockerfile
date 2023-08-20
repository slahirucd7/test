# syntax=docker/dockerfile:1

FROM python:3.9.2

WORKDIR python-docker

RUN groupadd -g 2000 go && useradd -m -u 2001 -g go go
USER go

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]