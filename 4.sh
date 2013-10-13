#!/bin/bash
# 4. Найти в директории файлы, группа-владелец которых содержит указанного пользователя и время с момента создания файла не более N минут. N передается параметром
origGroupsStr=$(groups $3)
newGroupsStr=${origGroupsStr##$3 :}
echo "All groups for "$3" : "$newGroupsStr"\nFiles which was modificate in last "$2" minutes and containings in "$1" and has owner one of this groups : "
for group in $newGroupsStr
do
  for filename in $(find $1 -type f -mmin -$2 -group $group)
  do
    echo "filename : "$filename" group owner : "$group
  done
done
