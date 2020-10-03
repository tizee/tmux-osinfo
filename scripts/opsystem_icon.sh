#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $CURRENT_DIR/helper.sh

opsystem_icon_string="@opsystem_icon"
default_osx=""
default_freebsd=""
default_linux=""
default_cygwin=""
default_other=""

is_osx() {
  [[ $(uname -s) =~ Darwin* ]]
}

is_linux() {
  [[ $(uname -s) =~ Linux* ]]
}

is_freebsd(){
  [[ $(uname -s) =~ FreeBSD* ]]
}

is_cygwin(){
  [[ $(uname -s) =~ CYGWIN* ]]
}

icon_default(){
  if is_osx;then
    echo "$default_osx"
  elif is_linux;then
    echo "$default_linux"
  elif is_freebsd;then
    echo "$default_freebsd"
  elif is_cygwin;then
    echo "$default_cygwin"
  else
    echo "$default_other"
  fi
}

print_icon(){
  printf "$(get_tmux_option "$opsystem_icon_string" "$(icon_default)")"
}

main(){
  print_icon
}
main
