FROM ruby:2.6.3-alpine3.10
RUN apk add --update --no-cache build-base nodejs sqlite-dev tzdata bash curl
ENV RAILS_ROOT /var/www/
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT
COPY Gemfile  .
RUN gem install bundler
RUN bundle
RUN bundle install
COPY . ./
RUN mv entrypoint.sh /sbin/entrypoint.sh
RUN chmod +x /sbin/entrypoint.sh
CMD ["/sbin/entrypoint.sh"]