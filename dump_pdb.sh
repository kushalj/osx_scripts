name=$(cat $HOME/scripts/PROJECT_NAME.txt)
extension=$(cat $HOME/scripts/PROJECT_EXT.txt)
project=$name$extension

#this creates the database project name+extension

echo "dumping $project to $1.dump"
pg_dump -Fc --no-acl --no-owner $project > $1.dump

