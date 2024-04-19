# Use the Python 3.8 image as base
FROM python:3.8

# Set working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Create a virtual environment and activate it
RUN python3 -m venv ./venv
RUN . ./venv/bin/activate

# Install dependencies from requirements.txt
RUN pip3 install -r requirements.txt

# Install tmux
RUN apt-get update && apt-get install -y tmux

# Expose port 8080
EXPOSE 8080

# Start the WebStreamer
CMD [ "python3", "-m", "WebStreamer" ]
