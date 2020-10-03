#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/scripts/helper.sh"

sys_placeholders=(
  "\#{opsystem_icon}",
  "\#{opsystem_version}"
)

sys_commands=(
"#($CURRENT_DIR/scripts/opsystem_icon.sh)",
"#($CURRENT_DIR/scripts/opsystem_version.sh)"
)


do_interpolation(){
  local string="$1"
  for ((i=0; i<${#commands[@]}; i++));do
    string="${string//${sys_placeholders[$i]}/${sys_commands[$i]}}"
  done
  echo "$string"
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
