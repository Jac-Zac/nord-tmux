show_window_default_format() {
  local number="#I"
  local color="$thm_gray"
  local background="$thm_black4"
    local text="$(get_tmux_option "@nord_window_default_text" "#W")" # use #W for application instead of directory
    local fill="$(get_tmux_option "@nord_window_default_fill" "number")" # number, all, none

  local default_window_format=$( build_window_format "$number" "$color" "$background" "$text" "$fill" )

  echo "$default_window_format"
}
