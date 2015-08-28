# Copyright (c) 2015 Shawn Webb
# License: 2-clause BSD

function loadavg() {
cat<<EOF
{
	"name": "loadavg",
	"full_text": "Load: $(uptime | sed 's/.*load averages: //' | awk -F\, '{print $1 $2 $3}')"
}
EOF
}
