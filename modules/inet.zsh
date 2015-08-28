# Copyright (c) 2015 Shawn Webb
# License: 2-clause BSD

function inet() {
	local j=0
	foreach iface in ${interfaces}; do
		local ip=""
		ifconfig ${iface} inet | grep inet | while read line; do
			if [ ! -z ${ip} ]; then
				ip="${ip} / "
			fi

			ip="$(echo ${line} | awk '{print $2;}')"
		done

		if [ -z "${ip}" ]; then
			ip="NONE"
		fi

		ifconfig ${iface} inet6 | grep inet6 | while read line; do
			local ip6=$(echo ${line} | awk '{print $2;}')
			if [ ! -z "${ip6}" ]; then
				if [ ! -z "${ip6%fe80*}" ]; then
					ip="${ip} / ${ip6}"
				fi
			fi
		done

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
