show_window_current_format() {
  local number="#I"
  local color="$thm_cyan"
  local background="$thm_black4"
   local text="$(get_tmux_option "@nord_window_current_text" "#W#{?window_zoomed_flag,(),}")" # use #W for application instead of directory
  local fill="$(get_tmux_option "@nord_window_current_fill" "number")" # number, all, none

  local current_window_format=$( build_window_format "$number" "$color" "$background" "$text" "$fill" "" )

  echo "$current_window_format"
}
