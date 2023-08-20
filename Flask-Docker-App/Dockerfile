# syntax=docker/dockerfile:1

FROM python:3.9.2-alpine
RUN /usr/local/bin/python -m pip install --upgrade pip

WORKDIR python-docker

RUN addgroup -g 10014 choreo && \
    adduser  --disabled-password  --no-create-home --uid 10014 --ingroup choreo choreouser
USER 10014

COPY requirements.txt requirements.txt
COPY . .

RUN . venv/bin/activate
RUN echo "Listing the path"
RUN ls -al
RUN pip install -r requirements.txt

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]