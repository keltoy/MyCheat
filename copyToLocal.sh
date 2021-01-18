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


SOURCE="$CURRENT_DIR/personal"

echo "copy from $SOURCE to $PERSONAL_DIR"

cp -r $SOURCE/* $PERSONAL_DIR/

echo "copy is done."
