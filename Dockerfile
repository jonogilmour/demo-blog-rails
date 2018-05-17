FROM ruby:2.5
RUN apt-get update -qq
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get install -y build-essential nodejs
RUN npm install -g npm
RUN mkdir /blog
WORKDIR /blog
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install
COPY . .
