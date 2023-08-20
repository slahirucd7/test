# syntax=docker/dockerfile:1

FROM python:3.9.2-alpine

WORKDIR python-docker

RUN addgroup -g 10014 choreo && \
    adduser  --disabled-password  --no-create-home --uid 10014 --ingroup choreo choreouser
USER 10014

COPY requirements.txt requirements.txt

RUN /usr/local/bin/python -m pip install --upgrade pip --user
RUN ls
RUN pip3 install -r requirements.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]