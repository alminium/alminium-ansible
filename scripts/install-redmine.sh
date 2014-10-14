#!/bin/sh

cd $1

gem install bundle
bundle install --path vendor/bundler --without development test postgresql sqlite
bundle exec rake generate_secret_token
bundle exec rake db:migrate RAILS_ENV=production
echo "ja" |bundle exec rake redmine:load_default_data RAILS_ENV=production
gem install passenger --no-rdoc --no-ri
passenger-install-apache2-module --auto
passenger-install-apache2-module --snippet > /etc/httpd/conf.d/passenger.conf

