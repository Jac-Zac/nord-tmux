show_directory() {
  local index=$1
  local icon=$(get_tmux_option "@nord_directory_icon" "")
  local color=$(get_tmux_option "@nord_directory_color" "$thm_blue")
  local text=$(get_tmux_option "@nord_directory_text" "#{b:pane_current_path}")

  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
