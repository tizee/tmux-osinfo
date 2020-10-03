#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $CURRENT_DIR/helper.sh

opsystem_version_string="@opsystem_version"

get_version(){
  echo "$(uname -r)"
}

print_version(){
  printf "$(get_tmux_option "$opsystem_version_string" "$(get_version)")"
}

main(){
  print_version
}

main
