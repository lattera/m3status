function bhyvevms() {
	local vms=""

	foreach file in $(find /dev/vmm); do
		file=${file/\/dev\/vmm/}
		if [ -z "${file}" ]; then
			continue
		fi

		file=${file/\//}

		if [ ! -z ${vms} ]; then
			vms="${vms} "
		fi

		vms="${vms}${file}"
	done

	if [ -z ${vms} ]; then
		vms="NONE"
	fi

	cat<<EOF
		{
			"name": "Bhyve_VMs",
			"full_text": "bhyve: ${vms}"
		}
EOF
}
