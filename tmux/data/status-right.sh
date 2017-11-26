#!/bin/bash
FG="234"

# Gather information
date="$(date +"%H:%M")"
hostname="$(hostname | awk '{split($0,a,"."); print a[1]}')"
load="$(uptime | awk '{print $10}' | sed 's/,//g')"
mem="$(free | grep "Mem" | awk '{printf("%d%%", (($2 - $7) / $2) * 100)}')"
cpu="$(awk -v a="$(awk '/cpu /{print $2+$4,$2+$4+$5}' /proc/stat; sleep 1)" '/cpu /{split(a,b," "); printf("%d%%", 100*($2+$4-b[1])/($2+$4+$5-b[2]))}' /proc/stat)"

# Get the host color
h=$( hostname | sum | awk '{print($1)}' )
color=$(( h % 200 ))

# Build the status bar
result="#[fg=colour255]${date} #[default]"
result="${result}#[bg=colour${color},fg=colour${FG},bold] ${hostname}#[default]"
result="${result}#[bg=colour${color},fg=colour${FG}]: load #[bold]${load}#[default]"
result="${result}#[bg=colour${color},fg=colour${FG}], ram #[bold]${mem}#[default]"
result="${result}#[bg=colour${color},fg=colour${FG}], cpu #[bold]${cpu}#[default]"
result="${result}#[bg=colour${color},fg=colour${FG}] "

echo "${result}"
