#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/scripts/helper.sh"

icon_placeholder="\#{opsystem_icon}"
icon_value="#($CURRENT_DIR/scripts/opsystem_icon.sh)"
version_placeholder="\#{opsystem_version}"
version_value="#($CURRENT_DIR/scripts/opsystem_version.sh)"

do_interpolation(){
  local string="$1"
  local result=""
  result="${string/$icon_placeholder/$icon_value}"
  result="${result/$version_placeholder/$version_value}"
  echo "$result"
}

update_tmux_option(){
  local option="$1"
  local option_value="$(get_tmux_option "$option")"
  local new_option_value="$(do_interpolation "$option_value")"
  set_tmux_option "$option" "$new_option_value"
}

main(){
  update_tmux_option "status-right"
  update_tmux_option "status-left"
}

main
