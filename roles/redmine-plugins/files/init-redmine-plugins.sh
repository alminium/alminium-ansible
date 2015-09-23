#!/bin/sh

## setup plugin
pushd .

echo $INSTALL_DIR override.

INSTALL_DIR=/opt/alminium

cd $INSTALL_DIR

# for Hudson
mv plugins/redmine_hudson/Gemfile plugins/redmine_hudson/Gemfile.org

export RAILS_ENV=production
bundle install --path vendor/bundler --without development test postgresql sqlite
bundle exec rake redmine:plugins:migrate
bundle exec rake generate_secret_token
bundle exec rake db:migrate
bundle exec rake tmp:cache:clear
bundle exec rake tmp:sessions:clear
bundle exec rake redmine:plugins:process_version_change
touch backlogs.dev
bundle exec rake redmine:backlogs:install labels=false
#bundle exec rake redmine:backlogs:install task_tracker=サポート story_trackers=機能 labels=false

# FIXME: to avoid open_flash_chart assets aren't copied.
cp -fr plugins/open_flash_chart/assets public/plugin_assets/open_flash_chart

popd

