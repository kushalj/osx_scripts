#!/bin/bash
# $1 is username
# Needs $2 .git and $3.git to exist
git clone --bare https://github.com/$1/$2.git

cd $2.git
echo "pushing mirror $3.git..."
git push --mirror https://github.com/$1/$3.git

cd ..
echo "deleting local repos" 
rm -rf $2.git
rm -rf $3.git

echo "cloning Â$3 fromhttps://github.com/$1/$3"
git clone https://github.com/$1/$3
echo "done"


