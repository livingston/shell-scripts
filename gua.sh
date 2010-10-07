#!/usr/bin/sh

#Short command to update all the git repositories in the current directory

gua()
{
base=$(pwd)
folder_list=$(find -type d -maxdepth 1)
folder_size=$(find -type d -maxdepth 1| wc -l)
count=0
for folder in $folder_list
do
  count=$[$count+1]
  echo -ne "Updating $count of $folder_size \r";

  cd $folder
  if [ -d ".git" ]; then
    git pull > /dev/null 2>&1
  fi
  cd $base
done
echo -ne '\n'
}