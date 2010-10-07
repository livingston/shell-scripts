#!/usr/bin/sh

#Short command to update all the git repositories in the current directory

gua()
{
base=$(pwd)
for folder in $(find -type d -maxdepth 1)
do
  cd $folder
  if [ -d ".git" ]; then
    echo "UPDATING $folder ..."
    git pull
  fi
  cd $base
done
}