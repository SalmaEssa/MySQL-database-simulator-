user=$(whoami)

isAdmin=$(cat DB_admins.db | grep $user | wc -l )
if [[ $isAdmin -ne 1 ]]
then
echo "only admins can delete databases"


fi
if [[ $isAdmin -eq 1 ]]
then
select DB in $(ls DataBases)
do

owner=$(cat DataBases/$DB/owner.txt)

if [[ $owner==$user ]]
then 
if [[ ! -z $DB ]]

then
rm -rf DataBases/$DB


echo $DB "deleted successfully"

else
echo "not valid select number"

fi
else
echo "only the owner of this database can delete it"
fi


done

fi
