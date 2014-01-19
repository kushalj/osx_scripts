
# Usage: git_setup "user name" "email"

git config --global user.name $1
git config --global user.email $2
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'

ssh-keygen -t rsa -C $2
cat ~/.ssh/id_rsa.pub
echo ""


