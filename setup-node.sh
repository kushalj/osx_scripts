#!/bin/bash

# Save current working directory
currentdir=$(pwd)

git clone https://github.com/kushalj/setup-node
cd setup-node
./setup.sh

# let's return
cd $currentdir

echo ""
echo 'You may want to run:'
echo 'source git_setup.sh "Name Surname" "email@address.com"'
echo ""

