#!/usr/bin/sh

#Short command to clone a git repository
## USAGE: gc git://github.com/livingston/rotator.git
## this command will clone the git repo in a folder of the format {GITHUB_USER-NAME}_{REPO-NAME}

gc()
{
  str=$1

  if [ $str ]; then
    uvar=`echo $str | perl -pe 's/(git|https)+(@|:|\/)+[^:\/]*[:\/]{1}([^\/]*)\/([^\/]*)\.git/"$3_$4"/e'`

    git clone $str $uvar
  else
    echo 'Enter a valid repo URL'
  fi
}
