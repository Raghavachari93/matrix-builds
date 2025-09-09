# Use build arg to select Python version
ARG PYTHON_VERSION=3.9
FROM python:${PYTHON_VERSION}-slim

WORKDIR /app

# Install OS deps (if any) and pip install app dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000
CMD ["python", "app.py"]

