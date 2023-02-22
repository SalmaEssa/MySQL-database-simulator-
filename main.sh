select i in "Create Database user." "Delete Database User."  "Create new Database." "Delete an existing Database." "Create A new Table inside Database." "Insert A New Row in a Table." "Select Data from Table."
do

if [[ $i == "Create Database user." ]]
then
echo "will create user"
fi



if [[ $i == "Delete Database User." ]]
then
echo "will delete user"
fi


if [[ $i == "Create new Database." ]]
then
echo "data base will create"
fi


if [[ $i == "Delete an existing Database." ]]
then
echo "data base will delete"
fi

if [[ $i == "Create A new Table inside Database." ]]
then
echo "table will be created"
fi

if [[ $i == "Insert A New Row in a Table." ]]
then
echo "insert row"
fi

if [[ $i == "Select Data from Table." ]]
then
echo "select data"
fi



done
