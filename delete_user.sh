
user=$(whoami)

isAdmin=$(cat DB_admins.db | grep $user | wc -l )




if [[ $isAdmin -ne 1 ]]
then
echo "only admins can delete database users"

fi
if [[ $isAdmin -eq 1 ]]
then

select user in $(<DB_admins.db)
do

if [[ $user == "oracle" ]]
then
echo "user oracle can’t be deleted."

elif [[ ! -z $user ]]

then
sed -i "/$user/d" ./DB_admins.db

echo $user "deleted successfully"

else

echo "select valid number"
fi


done


fi
