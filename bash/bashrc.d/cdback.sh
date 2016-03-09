# This script provides a nicer "cd .." command, which is only two dots, and
# another dot for each additional level you want to go down
#
# Examples:
#  ..     => cd ..
#  ...    => cd ../..
#  ...... => cd ../../../../../..
#
# By default this script overrides the command_not_found_handle and
# PROMPT_COMMAND in bash, which can have side effects (for example losing your
# default distribution one), but with my dotfiles it simply hook into my custom
# handler (look at my bashrc).
#
# Script made by Pietro Albini <pietro@pietroalbini.io>
# Released under the UNLICENSE license, aka public domain


# /dev/shm is stored in RAM
_CDBACK_PATH="/dev/shm/bashrc-cdback-${USER}-${BASHPID}"


# Pass the real command as first argument
_cdback_command() {
    arg="$1"

    # Count the number of dots in the command
    count="`echo "$1" | grep -o "\." | wc -l`"
    dots=$(( count - 1 ))

    # If there are other chars abort
    if [[ "${#1}" -ne "${count}" ]]; then
        return 1
    fi

    # Prepare the storage file
    touch "${_CDBACK_PATH}"
    chmod 0600 "${_CDBACK_PATH}"

    # The number of dots is saved into a file, which will be read by
    # $PROMPT_COMMAND which will execute the `cd`s later. It's implemented this
    # way because it's not possible to have `cd`s executed there propagate to
    # the main shell, since this is treated like a standalone command
    echo "${dots}" > "${_CDBACK_PATH}"

}


_cdback_after_command() {
    # If the custom command was called before, execute its core logic there.
    # You can read an explaination on why this is implemented this way above.
    if [[ -f "${_CDBACK_PATH}" ]]; then
        dots="`cat "${_CDBACK_PATH}"`"
        for ((i=0;i<"${dots}";i++)); do
            cd ..
        done

        rm "${_CDBACK_PATH}"
    fi
}


# This code only works for my dotfiles, since I built an hook system which
# gives me the ability to have multiple command_not_found_handle and
# $PROMPT_COMMAND. A fallback (quite invasive actually) is available if you
# want to use the script as standalone
if type bashrc_cnf_handler >/dev/null 2>&1 \
&& type bashrc_after_command >/dev/null 2>&1; then

    _cdback_integrations_bashrc() {
        # 100 means to stop executing the other hooks
        if _cdback_command "$1"; then
            return 100
        else
            return 0
        fi
    }

    bashrc_cnf_handler "_cdback_integrations_bashrc"
    bashrc_after_command "_cdback_after_command"

# This overrides command_not_found_handle and $PROMPT_COMMAND, be warned!
else

    command_not_found_handle() {
        if _cdback_command "$1"; then
            return
        else
            # A generic default message, nothing fancy
            echo "Command not found: $1"
        fi
    }

    PROMPT_COMMAND="_cdback_after_command"

fi
