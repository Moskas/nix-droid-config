{ pkgs, ... }:

pkgs.writeShellScriptBin "bat-stat" ''
  # Find the first battery directory
  battery_dir=$(ls /sys/class/power_supply/ | grep "BAT*" | awk '{print $1}')

  if [ -n "$battery_dir" ]; then
    # Get battery capacity
    for battery in $battery_dir;
    do
    capacity=$(cat "/sys/class/power_supply/$battery/capacity")

    # Get battery status
    status=$(cat "/sys/class/power_supply/$battery/status")

    # Determine symbol based on status
    case "$status" in
      "Charging")
        symbol="󱟠"
        ;;
      "Discharging")
        symbol="󱟞"
        ;;
      "Full")
        symbol="󰁹"
        ;;
      "Unknown")
        symbol="󰂑"
        ;;
      "Not charging")
        symbol="󱟢"
        ;;
      *)
        symbol="󰂑"
        ;;
    esac

    # Print battery capacity and status
    printf "%s %s%% " "$symbol" "$capacity"
    done;
  fi
''
