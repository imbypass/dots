#!/bin/bash

main() {
  current_level='0'
  new_level=''
  while true
  do
    new_level=$(bash-fuzzy-clock)
    if [ "$current_level" != "$new_level" ]; then
      current_level="$new_level"
      echo "$new_level"
    fi
    sleep 60
  done
}

main
