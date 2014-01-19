#!/bin/bash
echo $1 > $HOME/scripts/PROJECT_NAME.txt
echo $2 > $HOME/scripts/PROJECT_EXT.txt

name=$(cat $HOME/scripts/PROJECT_NAME.txt)
extension=$(cat $HOME/scripts/PROJECT_EXT.txt)
project=$name$extension

mkdir $HOME/$project

# for python projects
# virtualenv $HOME/$name-env


cp $HOME/scripts/.bashrc_custom ~/

wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

echo ""
echo "you may need these:"
echo ""
echo "sudo su postgres"
echo "createuser vagrant -P"
echo ""
echo "ssh-keygen"
echo "heroku keys:add ~/.ssh/id_rsa.pub"
echo ""




