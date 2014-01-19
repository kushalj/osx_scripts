name=$(cat $HOME/scripts/PROJECT_NAME.txt)
extension=$(cat $HOME/scripts/PROJECT_EXT.txt)
project=$name$extension

#echo "dropping db $project"
#dropdb $project


echo "restoring db from $1.dump"
pg_restore --verbose --no-acl --no-owner --clean -h localhost -U vagrant -d $project $1.dump



