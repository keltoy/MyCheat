#! /bin/bash

# copy to local
# 将personal 目录拷贝到 本地
set -e

PERSONAL_DIR=~/.config/cheat/cheatsheets/personal

if [ $# -gt 0 ];
then
  PERSONAL_DIR=$1
fi

CURRENT_DIR=$(dirname "$0")


SYNC=$CURRENT_DIR/personal

echo "sync from $PERSONAL_DIR to $SYNC"


for sheet in $PERSONAL_DIR/*
do
  file=${sheet##*/}
  echo "check $file"
  if [ ! -e $SYNC/$file ];
  then 
    echo "$sheet need sync"
    cp -r $sheet $SYNC/
  else 
    s=`cmp --silent $sheet $SYNC/$file && echo 0 || echo 1`
    if [ $s = 1 ]
    then 
      echo "$file need update"
      cp -r $sheet $SYNC/
    fi 
  fi
done

#cp -r $PERSONAL_DIR/* $SYNC/

echo "copy is done."
