function battery() {
cat<<EOF
{
	"name": "battery",
	"full_text": "Battery: $(sysctl -n hw.acpi.battery.life)%"
}
EOF
}
