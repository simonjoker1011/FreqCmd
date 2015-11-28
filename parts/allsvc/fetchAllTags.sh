#!/bin/bash

cd $1
git pull origin master
gradle forall -Pcmd="git fetch && git fetch --tags"

