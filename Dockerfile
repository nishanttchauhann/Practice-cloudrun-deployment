FROM python:3.11-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY . .

# Use PORT from env, default to 8080
ENV PORT 8080

# Start the app with Gunicorn binding to $PORT
CMD exec gunicorn --bind 0.0.0.0:$PORT --workers 1 main:app

