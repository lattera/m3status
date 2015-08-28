# Copyright (c) 2015 Shawn Webb
# License: 2-clause BSD

if [ -z "${myver}" ]; then
	myver=""
fi

function kver() {
	if [ -z ${myver} ]; then
		myver=$(uname -v | awk '{print $4;}')
		myver=${myver%\(*}
	fi

	cat<<EOF
		{
			"name": "kernel_version",
			"full_text": "KVER: ${myver}"
		}
EOF
}
