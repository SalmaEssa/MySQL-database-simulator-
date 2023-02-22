user=$(whoami)

isAdmin=$(cat DB_admins.db | grep $user | wc -l )
if [[ $isAdmin -ne 1 ]]
then
echo "only admins can create databases"


fi
if [[ $isAdmin -eq 1 ]]
then

echo "please enter database name"
read dbName

exisit=$(ls DataBases | grep $dbName | wc -l )
if [[ $exisit -eq 1 ]]
then
echo  "this database alreay exisits"
fi
if [[ $exisit -ne 1 ]]
then
mkdir DataBases/$dbName

echo "database created successfully"

fi

fi
