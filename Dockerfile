FROM ruby:2.3.0
MAINTAINER Sebastian Messmer <messmer@cryfs.org>

# Update system and install some packages
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libpq-dev nodejs npm
RUN ln -s /usr/bin/nodejs /usr/bin/node

ENV RAILS_ENV=production
# TODO Use a permanent, not-commited-to-git "rake secret"
ENV SECRET_KEY_BASE=a0a980df0dc874cd399c412c652720aea2f983c9d07b5956de65bb943b6d6f6eb5bc6a9754ffe9e8364e9dbe1be2a1bccc7accba4d31c4014757781dc4530167

# Workaround to make "gem install rails" working. Should be fixed in nokogiri 1.6.8.
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libxml2-dev libxslt-dev
RUN bundle config build.nokogiri --use-system-libraries

# Only add Gemfile at first, so only a change in the Gemfile causes a run of "bundle install" when recreating the docker image.
ADD Gemfile Gemfile.lock /source/
WORKDIR /source
RUN bundle install --deployment --without development test

# Add source
ADD . /source
RUN rm /source/.git

RUN rake assets:precompile

# A dummy command keeps the container running
CMD rails server --binding=0.0.0.0 --port=80 --environment=production

EXPOSE 80

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
