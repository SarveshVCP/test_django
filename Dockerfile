
FROM python:3.12.2-slim as base

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . /app/

# Set executable permissions
RUN chmod +x /app/start-server.sh

# Expose port
EXPOSE 8000

# Run the script
CMD ["/app/start-server.sh"]
