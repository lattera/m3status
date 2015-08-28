function mytime() {
cat <<EOF
{
	"name": "time",
	"full_text": "$(date '+%T')"
}
EOF
}
