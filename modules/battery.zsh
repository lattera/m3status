# Copyright (c) 2015 Shawn Webb
# License: 2-clause BSD

function FreeBSD_battery_status() {
    local charging=$(sysctl -n hw.acpi.battery.state)

    if [ ${charging} -eq 0 ]; then
        charging="Power"
    else
        charging="Battery"
    fi

cat<<EOF
{
	"name": "charging",
	"full_text": "Source: ${charging}"
}
EOF
}

function FreeBSD_battery_life() {
    local life=$(sysctl -n hw.acpi.battery.life)

    cat <<EOF
    {
        "name": "battery",
        "full_text": "Battery: ${life}%"
    },
EOF
}

function Linux_battery_status() {
    local charging=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | awk '{print $2;}')

    cat <<EOF
    {
        "name": "charging",
        "full_text": "Source: ${charging}"
    }
EOF
}

function Linux_battery_life() {
    local life=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2;}')

    cat <<EOF
    {
        "name": "battery",
        "full_text": "Battery: ${life}"
    }
EOF
}

function battery() {
    local mystatus=""
    mystatus=$($(uname)_battery_life)
    mystatus="${mystatus},\n$($(uname)_battery_status)"

    echo "${mystatus}"
}
