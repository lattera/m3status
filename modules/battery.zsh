function battery() {
	local life=$(sysctl -n hw.acpi.battery.life)
	local charging=$(sysctl -n hw.acpi.battery.state)

	if [ ${charging} -eq 0 ]; then
		charging="Power"
	else
		charging="Battery"
	fi

cat<<EOF
{
	"name": "battery",
	"full_text": "Battery: ${life}%"
},
{
	"name": "charging",
	"full_text": "Source: ${charging}"
}
EOF
}
