# syntax=docker/dockerfile:1.7

FROM python:3.13.15-alpine3.23

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

WORKDIR /app

RUN addgroup \
        --system \
        --gid 10001 \
        app \
    && adduser \
        --system \
        --disabled-password \
        --no-create-home \
        --uid 10001 \
        --ingroup app \
        app

COPY requirements.txt ./

RUN --mount=type=cache,target=/root/.cache/pip \
    pip install --no-cache-dir --requirement requirements.txt

COPY --chown=app:app app.py ./

USER 10001:10001

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD ["python", "-c", "import urllib.request; urllib.request.urlopen('http://127.0.0.1:8080/healthz', timeout=2)"]

CMD ["gunicorn", "--bind=0.0.0.0:8080", "--workers=2", "--threads=2", "--timeout=30", "--access-logfile=-", "--error-logfile=-", "app:app"]