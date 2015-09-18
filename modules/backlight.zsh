function backlight() {
	val=$(sudo intel_backlight | awk '{print $4;}')

	cat <<EOF
	{
		"name": "backlight",
		"full_text": "Backlight: ${val}"
	}
EOF
}
