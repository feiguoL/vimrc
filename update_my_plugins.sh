#!/bin/bash
set -e

my_plugins_dir="$HOME/.vim_runtime/my_plugins/"

cd ${my_plugins_dir}

for i in `ls`; do
{
  cd "$i"
  echo "plugin: $i " `git pull --rebase`
}&
done
wait

echo "Update the My plugins successfully! Enjoy :-)"
