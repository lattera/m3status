function cpuidle() {
	amt=$(vmstat -c 2 1 | sed -e 1,3d | awk '{print $19;}')

	cat <<EOF
	{
		"name": "cpuidle",
		"full_text": "CPU: ${amt}% Idle"
	}
EOF
}
