#!/bin/bash

DIR=$(cd `dirname $0` && pwd)
for host in $@ ; do
  echo "Deploying to ${host}..."
  ssh -fT $host mkdir -p dotfiles
  scp -r $DIR ${host}:dotfiles/
  ssh -fT $host ./dotfiles/vim/install.sh
done
