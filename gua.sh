#!/usr/bin/sh

#Short command to update all the git repositories in the current directory

gua()
{
startt=`date +%s`
base=$(pwd)
folder_list=$(find -type d -maxdepth 2 -name '.git')
folder_size=`echo ${folder_list[@]} | sed s:/\.git:'\n':g | grep -c './'`
count=0
echo -ne '\n'
for repo_path in $folder_list
do
  count=$[$count+1]
  folder=`echo $repo_path | awk -F '/' '{printf("%s", $2)}'`

  cd $folder
    echo -ne "Updating $count of $folder_size \r";
    git pull > /dev/null 2>&1
  cd $base
done
echo -ne '\n'
echo -ne "\nUpdate completed in $((`date +%s` - $startt)) secs. \n"
}