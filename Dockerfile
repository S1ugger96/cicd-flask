FROM python:3.11-slim
WORKDIR /app
ENV PYTHONUNBUFFERED=1
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY app.py .
RUN useradd -m appuser
RUN chown -R appuser:appuser /app
USER appuser
EXPOSE 5000
CMD ["python", "app.py"]
