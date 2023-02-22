user=$(whoami)

isAdmin=$(cat DB_admins.db | grep $user | wc -l )
if [[ $isAdmin -ne 1 ]]
then
echo "only admins can select data from tables"


fi
if [[ $isAdmin -eq 1 ]]
then
echo "select the DataBase"
select DB in $(ls DataBases)
do

owner=$(cat DataBases/$DB/owner.txt)

if [[ $owner==$user ]]
then 
echo "select the table"
select table in $(ls DataBases/$DB | grep -wv 'owner.txt'  )   
do
select i in "Show The content of the selected table" "Search inside table with specific string"
do
if [[ $i=="Show The content of the selected table" ]] 
then 
for row in $(cat DataBases/$DB/$table  |  awk ' {print $0}   '  )
do 
echo $(row)
done 

elif  [[  $i=="Search inside table with specific string" ]]
then 
read -p "Enter the string you want to search by  " searchString
echo  $( cat DataBases/$DB/$table | grep $searchString )


else 

echo "not valid select number"

fi

done 


done

else
echo "only the owner of this database can select  data"
fi


done

fi


