# use a node base image
FROM node:7-onbuild

# set maintainer
LABEL maintainer "miiro@getintodevops.com"

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1

# tell docker what port to expose
EXPOSE 8000
# Setup users and groups
RUN groupadd -g ${JENKINSGID} jenkins
RUN groupmod -g ${DOCKERGID} docker
RUN useradd -c "Jenkins user" -g ${JENKINSGID} -G ${DOCKERGID} -M -N -u ${JENKINSUID} jenkins
