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


for sheet in $PERSONAL_DIR
do
  if [ ! -e $sheet ];
  then 
    echo "$sheet need sync"
    cp -r $PERSONAL_DIR/$sheet $SYNC/
  fi
done

#cp -r $PERSONAL_DIR/* $SYNC/

echo "copy is done."
