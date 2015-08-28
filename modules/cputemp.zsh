function cputemp() {
cat<<EOF
{
	"name": "cputemp",
	"full_text": "CPU Temp: $(sysctl -n dev.cpu.0.temperature)"
}
EOF
}
