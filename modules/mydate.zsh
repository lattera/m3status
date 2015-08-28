function mydate() {
cat<<EOF
{
	"name": "date",
	"full_text": "$(date '+%A, %d %b %Y')"
}
EOF
}
