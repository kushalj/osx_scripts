#!/bin/bash

# run from project folder

name=$(cat $HOME/scripts/PROJECT_NAME.txt)
extension=$(cat $HOME/scripts/PROJECT_EXT.txt)
project=$name$extension

author="elysian"

git checkout -b develop
git branch
git push -u origin develop

git checkout -b staging
git branch
git push -u origin staging

heroku login
heroku keys:add
heroku apps:create $author-$project-s --remote staging-heroku
heroku apps:create $author-$project --remote production-heroku

