FROM ubuntu:18.04
LABEL maintainer="ontada-cds@mckesson.com"

# Update ubuntu to LTS Enablement - Supported until Spring 2028, CDS-8287
RUN sudo apt-get install --install-recommends linux-generic-hwe-18.04

ENV DEBIAN_FRONTEND noninteractive

# Add McKesson root certificate to cert chain
COPY ./src/McKesson_root.crt /usr/local/share/ca-certificates/

# Misc.
RUN apt-get update \
  && apt-get install -y --no-install-recommends tzdata \
  && apt-get install -y --fix-missing \
  apt-transport-https \
  apt-utils `# Wanted by debconf for package configuration` \
  build-essential \
  ca-certificates \
  curl \
  git \
  gnupg \
  imagemagick `# Needed by rmagick` \
  jq \
  libcurl4-openssl-dev `# Needed to pull in libcurl4 for curl installation and enable to openssl TLS backend` \
  libmagickcore-dev `# Needed by rmagick` \
  libmagickwand-dev `# Needed by rmagick` \
  libnss3 `# Needed by chromedriver` \
  libpq-dev `# Needed to install the 'pg' gem` \
  software-properties-common \
  unzip \
  zip \
  zlib1g-dev `# Needed to build the nokogiri version of libxml2` \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean \
  && update-ca-certificates

# set timezone to America/New_York
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

# Dockerize
ENV DOCKERIZE_VERSION v0.6.1
RUN curl --compressed -L --output dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

# old - not current
# ENV CHROMEDRIVER_VERSION 93.0.4577.63
# RUN curl -O https://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip \
#   && unzip chromedriver_linux64.zip -d /usr/local/bin && rm chromedriver_linux64.zip



# Install the latest stable Chrome
RUN curl -SO https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
  && apt-get update \
  && apt-get install -y ./google-chrome-stable_current_amd64.deb \
  && rm google-chrome-stable_current_amd64.deb \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

# current chrome install
RUN BROWSER_MAJOR=$(google-chrome --version | sed 's/Google Chrome \([1-9]..\).*/\1/g') && \
wget https://chromedriver.storage.googleapis.com/LATEST_RELEASE_${BROWSER_MAJOR} -O chrome_version && \
wget https://chromedriver.storage.googleapis.com/`cat chrome_version`/chromedriver_linux64.zip && \
unzip chromedriver_linux64.zip && \
mv chromedriver /usr/local/bin/ && \
DRIVER_MAJOR=$(chromedriver --version | sed 's/ChromeDriver \([0-9]..\).*/\1/g') && \
echo "chrome version: $BROWSER_MAJOR" && \
echo "chromedriver version: $DRIVER_MAJOR" && \
if [ $BROWSER_MAJOR != $DRIVER_MAJOR ]; \
  then echo "VERSION MISMATCH"; \
  exit 1; \
  fi

# PhantomJS
ENV PHANTOMJS_VERSION 2.1.1
RUN curl --compressed -L --output /usr/local/bin/phantomjs https://s3.amazonaws.com/circle-downloads/phantomjs-$PHANTOMJS_VERSION \
  && chmod a+x /usr/local/bin/phantomjs

# Ruby
ENV RUBY_VERSION 2.7.7
RUN echo 'deb https://apt.fullstaqruby.org ubuntu-18.04 main' > /etc/apt/sources.list.d/fullstaq-ruby.list \
  && curl -SLfO https://raw.githubusercontent.com/fullstaq-labs/fullstaq-ruby-server-edition/main/fullstaq-ruby.asc \
  && apt-key add fullstaq-ruby.asc \
  && apt-get update \
  && apt-get install -y fullstaq-ruby-common fullstaq-ruby-$RUBY_VERSION
ENV PATH /usr/lib/fullstaq-ruby/versions/2.7/bin/:$PATH

# Node
ENV NODE_VERSION 12.22.12
ENV DEB_FILE nodejs_$NODE_VERSION-1nodesource1_amd64.deb
RUN curl -sLO "https://deb.nodesource.com/node_12.x/pool/main/n/nodejs/${DEB_FILE}" \
  && apt-get install -y ./$DEB_FILE \
  && rm $DEB_FILE

# Yarn
ENV YARN_VERSION 1.22.19
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
  && apt-get update \
  && apt-get install yarn=$YARN_VERSION-1

# CodeClimate
RUN curl --compressed -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > /usr/local/bin/cc-test-reporter
RUN chmod a+x /usr/local/bin/cc-test-reporter

# Bundler
RUN echo 'gem: --no-document' >> ~/.gemrc
ENV BUNDLER_VERSION 2.3.26
RUN gem install bundler:$BUNDLER_VERSION
