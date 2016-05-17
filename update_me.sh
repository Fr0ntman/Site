#!/bin/bash

url=$SLACK_URL
username='DeployBot'

to="#general"
subject="Deploy"
emoji=":tophat:"

MessageText=$(git pull origin develop 2>&1)
bundle install
RAILS_ENV=production rake assets:clobber
RAILS_ENV=production rake assets:precompile
passenger stop -p 4000
passenger start -p 4000 -e production -d
exitstatus=$?


message="${subject}: $MessageText"
payload="payload={\"channel\": \"${to}\", \"username\": \"${username}\", \"text\": \"${message}\", \"icon_emoji\": \"${emoji}\"}"
curl -m 5 --data-urlencode "${payload}" $url
