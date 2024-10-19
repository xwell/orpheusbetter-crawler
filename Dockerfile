# Set the base image
FROM python:3.11-alpine3.20

MAINTAINER StarKayC

# Set the working directory
WORKDIR /

# Update System, Install packages & Clone Repo
RUN apk update && \
    apk add git mktorrent flac lame sox && \
    git clone https://github.com/StarKayC/orpheusbetter-crawler app

# Set the working directory
WORKDIR /app

# Create User, Create Folders, Set Permissions
RUN adduser -D orpheus && \
    mkdir /config /data /torrent && \
    chown orpheus:orpheus -R /config /data /torrent /app

# Set User
USER orpheus

# Set Home Folder, Timezone, Hostname
ENV HOME=/config \
    TZ=Etc/UTC \
    HOSTNAME=orpheusbetter

# Install pip packages
RUN pip install -r requirements.txt

# Have EntryPoint run app using command option
ENTRYPOINT ["/bin/sh", "-c"]