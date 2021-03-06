FROM ruby:2.3.0

RUN apt-get update -qq && apt-get install -y build-essential
RUN apt-get install -y libpq-dev
RUN apt-get install -y libxml2-dev libxslt1-dev
RUN apt-get install -y libqt4-webkit libqt4-dev xvfb
RUN apt-get install -y nodejs

ENV APP_HOME /compliments_io

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME
