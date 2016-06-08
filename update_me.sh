#!/bin/bash
rvm use 2.2@main
bundle install 1>/dev/null
RAILS_ENV=production rake assets:clobber 1>/dev/null
RAILS_ENV=production rake assets:precompile 1>/dev/null
passenger stop -p 4000
passenger start -p 4000 -e production -d
