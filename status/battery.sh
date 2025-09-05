  show_battery() {
    local index=$1
    local color=$(get_tmux_option "@nord_battery_color" "$thm_yellow")
    local text=$(get_tmux_option "@nord_battery_text" "#{battery_percentage}")

    # Get battery percentage and status
    local percentage=$(tmux display-message -p "#{battery_percentage}" 2>/dev/null || echo "100")
    local status=$(tmux display-message -p "#{battery_status}" 2>/dev/null || echo "unknown")

    # Determine icon based on status and percentage
    local icon
    case "$status" in
      "charging")
        icon=$(get_tmux_option "@batt_icon_status_charging" "󰂄")
        ;;
      "charged")
        icon=$(get_tmux_option "@batt_icon_status_charged" "󰚥")
        ;;
      "discharging")
        # Use tier icons based on percentage
        if [ "$percentage" -ge 90 ]; then
          icon=$(get_tmux_option "@batt_icon_charge_tier8" "󰁹")
        elif [ "$percentage" -ge 75 ]; then
          icon=$(get_tmux_option "@batt_icon_charge_tier7" "󰂁")
        elif [ "$percentage" -ge 60 ]; then
          icon=$(get_tmux_option "@batt_icon_charge_tier6" "󰁿")
        elif [ "$percentage" -ge 45 ]; then
          icon=$(get_tmux_option "@batt_icon_charge_tier5" "󰁾")
        elif [ "$percentage" -ge 30 ]; then
          icon=$(get_tmux_option "@batt_icon_charge_tier4" "󰁽")
        elif [ "$percentage" -ge 15 ]; then
          icon=$(get_tmux_option "@batt_icon_charge_tier3" "󰁼")
        elif [ "$percentage" -ge 5 ]; then
          icon=$(get_tmux_option "@batt_icon_charge_tier2" "󰁻")
        else
          icon=$(get_tmux_option "@batt_icon_charge_tier1" "󰁺")
        fi
        ;;
      "attached")
        icon=$(get_tmux_option "@batt_icon_status_attached" "󱈑")
        ;;
      *)
        icon=$(get_tmux_option "@batt_icon_status_unknown" "󰂑")
        ;;
    esac

    local module=$( build_status_module "$index" "$icon" "$color" "$text" )

    echo "$module"
  }

# Set battery icons once when theme loads
tmux set-option -g @batt_icon_charge_tier8 '󰁹'
tmux set-option -g @batt_icon_charge_tier7 '󰂁'
tmux set-option -g @batt_icon_charge_tier6 '󰁿'
tmux set-option -g @batt_icon_charge_tier5 '󰁾'
tmux set-option -g @batt_icon_charge_tier4 '󰁽'
tmux set-option -g @batt_icon_charge_tier3 '󰁼'
tmux set-option -g @batt_icon_charge_tier2 '󰁻'
tmux set-option -g @batt_icon_charge_tier1 '󰁺'
tmux set-option -g @batt_icon_status_charged '󰚥'
tmux set-option -g @batt_icon_status_charging '󰂄'
tmux set-option -g @batt_icon_status_discharging '󰂃'
tmux set-option -g @batt_icon_status_unknown '󰂑'
tmux set-option -g @batt_icon_status_attached '󱈑'
