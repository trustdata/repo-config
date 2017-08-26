#!/usr/bin/env sh
SCRIPT_PATH=`dirname $(readlink -f "$0")`
CWD=`pwd`
DEBUG=true

# get or infer package name
if [ -z $1 ]; then
  PACKAGE_NAME=@trust/`basename $(pwd)`
else
  PACKAGE_NAME=$1
fi

if [ debug ]; then
  echo "Script Path: $SCRIPT_PATH"
  echo "Current Working Directory: $CWD"
  echo "Package Name: $PACKAGE_NAME"
  echo ""
fi

# package.json check
if [ ! -f $CWD/package.json ]; then
  echo "NPM package.json file doesn't exist. Running npm init\n"
  npm init -y
fi

# copy configuration files
echo "Copying configuration files\n"
cp -r $SCRIPT_PATH/config/. $CWD

# configure package.json and dependencies
echo "Configuring scripts and dependencies\n"
node $SCRIPT_PATH/configure.js $PACKAGE_NAME

# install necessary npm dependencies
npm i mocha jsdoc chai nyc codecov --save-dev

# print out final package.json
echo "Final package.json"
cat $CWD/package.json
