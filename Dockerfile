FROM python:3.10.12-slim-buster

RUN python3 -m venv /app/venv

RUN /app/venv/bin/pip install --upgrade pip

WORKDIR /app

COPY requirements.txt /app/

RUN /app/venv/bin/pip install -r requirements.txt

COPY . /app/

RUN /app/venv/bin/python3 manage.py migrate

CMD ["/app/venv/bin/python3","manage.py", "runserver","0.0.0.0:8000"]
