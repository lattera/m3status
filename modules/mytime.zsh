# Copyright (c) 2015 Shawn Webb
# License: 2-clause BSD

function mytime() {
cat <<EOF
{
	"name": "time",
	"full_text": "$(date '+%T')"
}
EOF
}
