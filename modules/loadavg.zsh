function loadavg() {
cat<<EOF
{
	"name": "loadavg",
	"full_text": "Load: $(uptime | sed 's/.*load averages: //' | awk -F\, '{print $1 $2 $3}')"
}
EOF
}
