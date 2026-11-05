FROM python:3.13-alpine@sha256:7984cf56ceaddebe4fefeb75d64000b9f45d8b77b11a09b24524da6cdc3af0c8

RUN adduser -D user
USER user

WORKDIR /opt/rdgen

COPY . .
RUN pip install --no-cache-dir -r requirements.txt

ENV PYTHONUNBUFFERED=1

EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=5s --retries=3 CMD wget --spider 0.0.0.0:8000

CMD ["/bin/sh", "-c", "python manage.py migrate --noinput && exec /home/user/.local/bin/gunicorn -c gunicorn.conf.py rdgen.wsgi:application"]
