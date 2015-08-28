function inet() {
	local j=0
	foreach iface in ${interfaces}; do
		ip=$(ifconfig ${iface} inet | grep inet | awk '{print $2;}')
		if [ -z "${ip}" ]; then
			ip="NONE"
		fi

		if [ ${j} -gt 0 ]; then
			echo ","
		fi

		cat<<EOF
			{
				"name": "iface_${iface}",
				"full_text": "${iface}: ${ip}"
			}
EOF

			j=$((${j} + 1))
	done
}
