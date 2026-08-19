# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the web application code
COPY . .

# Copy the model directory from the parent context
# This requires running docker build from the parent directory `skripsi` 
# e.g., `docker build -t prompt-classifier -f webapp/Dockerfile .`
COPY best_model/ ./best_model/

# Expose Streamlit's default port
EXPOSE 8501

# Command to run the application
CMD ["streamlit", "run", "webapp/app.py", "--server.port=8501", "--server.address=0.0.0.0"]
