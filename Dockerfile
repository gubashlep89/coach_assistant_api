FROM ruby:3.0.0

ENV APP_HOME /myapp
ENV BUNDLER_VERSION 2.2.3
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle

RUN bundle install --without development test

ADD . $APP_HOME

# Make port 3000 available to the world outside this container
EXPOSE 3000