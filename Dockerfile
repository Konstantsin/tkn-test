FROM ruby:2.7.4-alpine

RUN apk update && apk upgrade && \
        apk add --update --no-cache \
        build-base \
        git

WORKDIR /app

COPY Gemfile Gemfile.lock tkn-test.gemspec ./
COPY lib/tkn/test/ lib/tkn/test/
RUN bundle install

COPY . .