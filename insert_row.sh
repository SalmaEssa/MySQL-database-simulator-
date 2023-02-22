user=$(whoami)

isAdmin=$(cat DB_admins.db | grep $user | wc -l )
if [[ $isAdmin -ne 1 ]]
then
echo "only admins can insert rows"


fi
if [[ $isAdmin -eq 1 ]]
then
select DB in $(ls DataBases)
do

owner=$(cat DataBases/$DB/owner.txt)

if [[ $owner==$user ]]
then 
select table in $(ls DataBases/$DB | grep -wv 'owner.txt'  )   ///note: -wv will neglect any owner.txt from the output
do
row="";
ind=0;

for col in $(head -n 1 DataBases/$DB/$table  | tr "," "\n"  )
do
echo "Enter "$col 
read   value
if [[ $ind -eq 0 ]]
then
isNotUnique=$(cat DataBases/$DB/$table | awk -F, '{print $1}'  |grep $value | wc -l )

if [[ $isNotUnique -ge 1 ]]
then
echo $value "already exisits and " $col " must be unique so try again or chose another table "
break

else 
row=$row$value","
fi 
ind=$(($ind+1));

done
row=${row:0:-1}
echo $row  >> DataBases/$DB/$table
done

else
echo "only the owner of this database can insert rows"
fi


done

fi


