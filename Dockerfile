FROM ubuntu:18.04
LABEL maintainer="kevin.olbrich@mckesson.com"

# Java
ENV JAVA_HOME=/jdk1.6.0_45
ENV PATH="${JAVA_HOME}/bin:${PATH}"
COPY ./src/jdk-6u45-linux-x64.bin ./jdk-6u45-linux-x64.bin
RUN chmod a+x ./jdk-6u45-linux-x64.bin
RUN ./jdk-6u45-linux-x64.bin
RUN rm ./jdk-6u45-linux-x64.bin
# Java test runner
RUN apt-get update && apt-get install -y ant

# Misc.
RUN apt-get update && apt-get install -y \
  apt-transport-https \
  build-essential \
  curl \
  git \
  imagemagick libmagickcore-dev libmagickwand-dev \
  jq \
  libcurl4 libcurl3-gnutls libcurl4-openssl-dev \
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

ENV CHROMEDRIVER_VERSION 89.0.4389.23
RUN curl -O https://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip -d /usr/local/bin && rm chromedriver_linux64.zip

# Install the latest stable Chrome
RUN curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

# PhantomJS
ENV PHANTOMJS_VERSION 2.1.1
RUN curl --compressed -L --output /usr/local/bin/phantomjs https://s3.amazonaws.com/circle-downloads/phantomjs-$PHANTOMJS_VERSION \
  && chmod a+x /usr/local/bin/phantomjs

# Ruby
ENV RUBY_VERSION 2.7
RUN apt-add-repository ppa:brightbox/ruby-ng \
  && apt-get update \
  && apt-get install -y ruby$RUBY_VERSION ruby$RUBY_VERSION-dev ruby-switch \
  && ruby-switch --set ruby$RUBY_VERSION

# ChefDK
ENV CHEFDK_VERSION 1.6.11
RUN curl --compressed -L --output chefdk_$CHEFDK_VERSION-1_amd64.deb https://packages.chef.io/stable/ubuntu/$(lsb_release -rs)/chefdk_$CHEFDK_VERSION-1_amd64.deb \
  && dpkg -i chefdk_$CHEFDK_VERSION-1_amd64.deb \
  && rm chefdk_$CHEFDK_VERSION-1_amd64.deb

ENV NODE_VERSION 14.15.4

RUN curl -sL https://deb.nodesource.com/setup_14.x| bash - \
  && apt-get install -y nodejs

# Yarn
ENV YARN_VERSION 1.22.5
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
  && apt-get update \
  && apt-get install yarn=$YARN_VERSION-1

# CodeClimate
RUN curl --compressed -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > /usr/local/bin/cc-test-reporter \
  && chmod a+x /usr/local/bin/cc-test-reporter

# Ruby gems & bundler
RUN echo 'gem: --no-document' >> ~/.gemrc
ENV RUBYGEMS_VERSION 3.1.4
RUN gem update --system $RUBYGEMS_VERSION
ENV BUNDLER_VERSION 2.2.7
RUN gem install bundler -v $BUNDLER_VERSION
