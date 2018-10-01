# Script made by Pietro Albini <pietro@pietroalbini.org>
# Released under the UNLICENSE license, aka public domain

# Number of seconds after the user is alerted when the command finishes
# If a command completes before this threshold no action is taken
ELAPSED_TIME_THRESHOLD=5

_elapsed_time_timer="-1"

_elapsed_time_start() {
    # Avoid overriding the timer if the function is called at the wrong time
    if [[ "$_elapsed_time_timer" -eq "-1" ]]; then
        _elapsed_time_timer="${SECONDS}"
    fi
}

_elapsed_time_stop() {
    result="$(($SECONDS - $_elapsed_time_timer))"
    _elapsed_time_timer="-1"

    # Ring a bell only inside tmux
    # The bell is then captured by tmux to show an alert
    if [[ ! -z "${TMUX+x}" ]]; then
        tput bel
    fi
}

trap "_elapsed_time_start" DEBUG
bashrc_after_command _elapsed_time_stop
