# Copyright (c) 2015 Shawn Webb
# License: 2-clause BSD

if [ -z "${activebe}" ]; then
	# Ensure ${activebe} is set in global namespace
	activebe=""
fi

function be() {
	if [ -z ${activebe} ]; then
		beadm list | while read line; do
			active=$(echo ${line} | awk '{print $2;}' | grep N)
			if [ ! -z "${active}" ]; then
				activebe=$(echo ${line} | awk '{print $1;}')
				break
			fi
		done
	fi

	if [ -z ${activebe} ]; then
		return
	fi

	cat <<EOF
		{
			"name": "bootenv",
			"full_text": "BE: ${activebe}"
		}
EOF
}
