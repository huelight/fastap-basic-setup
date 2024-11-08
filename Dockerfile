# Use Python 3.11 as the base image
FROM python:3.11-slim

# Set working directory inside the container
WORKDIR /app

# Copy the application code into the container
COPY ./app /app

# Copy the requirements file and install dependencies
COPY ./app/requirements.txt /app/requirements.txt

# Install dependencies with Python 3.11
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy the .env file into the container for environment variables
COPY ./app/.env /app/.env

# Expose FastAPI app port
EXPOSE 8000

# Set environment variables (ensure the app uses the appropriate config)
ENV PYTHONPATH=/app

# Run FastAPI using Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
