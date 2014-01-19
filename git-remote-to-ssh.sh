#!/bin/bash
# Usage: {remote name} {username} {repo name}
git remote -v
git remote rm $1
git remote add $1 git@github.com:$2/$3

echo ""
echo "Changed to:"
git remote -v
