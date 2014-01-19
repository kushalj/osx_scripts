#!/bin/bash

echo "git push origin develop"
gitpod
echo ""

echo "git checkout staging"
gitcs
echo ""


echo "git merge develop"
gitmd
echo ""

echo "git push origin staging"
gitpos
echo ""

echo "git checkout production/master"
gitcp
echo ""

echo "git merge staging"
gitms
echo ""

echo "git push origin production/master"
gitpop
echo ""




