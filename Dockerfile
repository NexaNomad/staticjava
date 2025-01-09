# Use an official Python runtime as a parent image
FROM python:3.12.7-alpine3.20 AS base_image

# Set the working directory in the container
WORKDIR /app

# Install Java (OpenJDK 11) and wget
RUN apk add --no-cache \
    openjdk11 \
    bash \
    wget

# Install Pylint
RUN pip install --no-cache-dir pylint

# Download Checkstyle jar
RUN wget -q -O checkstyle.jar https://github.com/checkstyle/checkstyle/releases/download/checkstyle-10.21.1/checkstyle-10.21.1-all.jar

# Download Google Checks Configuration for Checkstyle
RUN wget -q -O google_checks.xml https://raw.githubusercontent.com/checkstyle/checkstyle/master/src/main/resources/google_checks.xml

# Set environment variables for Java
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk
ENV PATH=$JAVA_HOME/bin:$PATH

# Copy the current directory contents into the container at /app
COPY . /app

# Set the default command to run when the container starts
CMD ["bash"]
