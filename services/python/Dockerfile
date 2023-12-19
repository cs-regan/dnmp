# Use the official Python 3.6 image as the base image
FROM python:3.6

# Set the working directory to /app
WORKDIR /app

# Install any needed dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Specify the command to run your application
CMD [ "python", "app.py" ]
