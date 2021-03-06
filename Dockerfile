FROM ubuntu:16.04
LABEL maintainer="kevin.olbrich@mckesson.com"

# Misc.
RUN apt-get update && apt-get install -y \
  apt-transport-https \
  build-essential \
  curl \
  git \
  jq \
  libcurl3 libcurl3-gnutls libcurl4-openssl-dev \
  libpq-dev \
  software-properties-common \
  tzdata \
  unzip \
  zip

# set timezone to America/New_York
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

# Dockerize
ENV DOCKERIZE_VERSION v0.6.1
RUN curl --compressed -L --output dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

# ChefDK
ENV CHEFDK_VERSION 1.6.11
RUN curl --compressed -L --output chefdk_$CHEFDK_VERSION-1_amd64.deb https://packages.chef.io/stable/ubuntu/$(lsb_release -rs)/chefdk_$CHEFDK_VERSION-1_amd64.deb \
  && dpkg -i chefdk_$CHEFDK_VERSION-1_amd64.deb \
  && rm chefdk_$CHEFDK_VERSION-1_amd64.deb

# CodeClimate
RUN curl --compressed -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > /usr/local/bin/cc-test-reporter \
  && chmod a+x /usr/local/bin/cc-test-reporter
