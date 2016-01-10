#!/bin/bash


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
GENDIR=$DIR/generated


function make_java() {
  echo "Building JAVA client for $1 API"
  swagger-codegen generate -l java -i $1.json -o $GENDIR/java -c config-java.json 2> build_$1.log
}

function make_swift() {
  echo Building SWIFT client
  swagger-codegen generate -l swift -i $1.json -o $GENDIR/swift -c config-swift.json 2> build_$1.log
}

function generate() {
  for api in candidates jobs; do
    for lang in java swift; do
      make_$lang $api
    done
  done
}


function clean() {
  rm -rf generated
  mkdir generated
}

function checks() {
  echo Checking required installed software
  local pass=true
  if ! type swagger-codegen 2>/dev/null; then
    echo "swagger-codegen not found. Please install it."
    pass=false
  fi
  if [ $pass = false ]; then
    echo Exiting.
    exit
  fi
}


function main() {
  echo "Mobster client generator"
  if [ "$1" = "publish" ]; then
    publish
  else
    checks
    clean
    generate
  fi
}

main $@