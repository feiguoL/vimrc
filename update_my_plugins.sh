#!/bin/bash
set -e

my_plugins_dir="$HOME/.vim_runtime/my_plugins/"
plugin_dir="$HOME/.vim_runtime/"
cd ${my_plugins_dir}

for i in `ls`; do
{
  cd "$i"
  echo "plugin: $i " `git pull --rebase`
}&
done
wait

cd ${plugin_dir}
python3 update_plugins.py
echo "Update the My plugins successfully! Enjoy :-)🎈🎈🎈"
