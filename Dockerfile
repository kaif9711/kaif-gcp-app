# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 8080

# Run the app using gunicorn (a production-ready server)
# This command runs the 'app' variable from the 'app.py' file
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
