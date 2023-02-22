user=$(whoami)

isAdmin =$(cat DB_admins.db | grep $user | wc -l )




if [[ $isAdmin -ne 1 ]]
then
echo "only admin can create database user"

fi

if [[ $isAdmin -eq 1 ]]
then
echo "enter admin name you want to add"
read adminName

isAlreadyExisits=$(cat DB_admins.db | grep $adminName | wc -l )

if [[ $isAlreadyExisits -eq 1 ]]
then
echo "the user is already exist"

fi

if [[ $isAlreadyExisits -ne 1 ]]
then
echo "$adminName"  >> DB_admins.db

echo $adminName "added successfully"


