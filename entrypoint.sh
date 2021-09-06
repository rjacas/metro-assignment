#!/bin/sh
echo "The environment is "$RAILS_ENV
if [ "$RAILS_ENV" = "development" ];
  then
    bundle
fi
echo "Starting the migration "
bundle exec rake db:migrate
#bundle exec rake db:seed
echo "The migration is over "
rm -rf /var/www/tmp/pids/server.pid || true
bundle exec rails s -p 3000 -b '0.0.0.0'