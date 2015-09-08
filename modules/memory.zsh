function memory() {
	mem=$(vmstat -h | sed -e 1,2d | awk '{print $5;}')

	cat <<EOF
	{
		"name": "memory",
		"full_text": "Free Mem: ${mem}"
	}
EOF
}
