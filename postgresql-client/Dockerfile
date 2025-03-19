# Use Alpine as the base image
FROM alpine:3.18

# Set PostgreSQL version
ARG PG_MAJOR

# Add PostgreSQL repository
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "https://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --no-cache postgresql$PG_MAJOR-client

# Set default command to psql
ENTRYPOINT ["psql"]

