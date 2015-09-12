function iocages() {
	cages=""

	iocage list | sed -e 1,1d | while read cage; do
		running=$(echo ${cage} | awk '{print $4;}')
		if [ ${running} = "up" ]; then
			name=$(echo ${cage} | awk '{print $5;}')
			if [ ! -z ${cages} ]; then
				cages="${cages} "
			fi

			cages="${cages}${name}"
		fi
	done

	cat <<EOF
		{
			"name": "iocage",
			"full_text": "iocage: ${cages}"
		}
EOF
}
