
FROM python:3.13-slim 
# Create the app directory

# Set the working directory inside the container
RUN mkdir /app
WORKDIR /app

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Upgrade pip
RUN pip install --upgrade pip

#install PostgressSQL
RUN apt-get update && apt-get install -y postgresql-client && rm -rf /var/lib/apt/lists/*

# Copy the Django project  and install dependencies
COPY requirements.txt  /app/

# run this command to install all dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project
COPY . /app/

# Copy the script to wait on the dp 
COPY wait-for-db.sh /app/
RUN chmod +x /app/wait-for-db.sh


# Expose the Django port
EXPOSE 8000

# Run Django’s development server
CMD ["/app/wait-for-db.sh","python", "manage.py", "runserver", "0.0.0.0:8000"]
