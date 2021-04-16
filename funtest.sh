#!/bin/sh

start() {
  echo "fun start"
}

calfun () {
  a = $1
  b = $2
  return a+b
}


start
echo calfun 1 2
