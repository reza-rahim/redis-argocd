# Use Alpine as base image
FROM python:3-alpine

# Install dependencies
RUN apk add --no-cache \
    curl \
    openssl \
 && pip install awscli

# Create non-root user
RUN adduser -D appuser

# Set working directory and switch to user
USER appuser
WORKDIR /home/appuser

# Set default shell
CMD ["/bin/sh"]
