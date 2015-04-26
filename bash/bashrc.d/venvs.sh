# This script will override the cd builtin, so when you switch to a directory
# containing a Python virtual environment, it will be activated.
#
# Feel free to use this or some parts of this as you want :-)

# Get the nearest environment
function nearest_venv () {
    # Change this to customize how the environment directory is named
    DIRECTORY_NAME="env"

    # Parse arguments
    directory="`pwd`"
    if [[ $# -eq 0 ]]; then
        env_name="${DIRECTORY_NAME}"
    else
        env_name="$1"
        if [[ $# -eq 2 ]]; then
            directory="$2"
        fi
    fi

    next=1
    last=0
    found=0
    while [[ ${next} -eq 1 ]]; do
        # Search for a venv in the directory
        env_path="`readlink -f ${directory}/${env_name}`"
        if [[ -f "${env_path}/bin/activate" ]]; then
            next=0
            found=1
        else
            # If there isn't a venv in this directory, prepare the parent for
            # the next loop
            directory="${directory}/.."
        fi
        # Block on the root to prevent infinite loop
        if [[ "`readlink -f ${directory}`" = "/" ]]; then
            if [[ ${last} -eq 0 ]]; then
                last=1
            else
                next=0
            fi
        fi
    done

    # If a result was found return it, else exit with error
    if [[ ${found} -eq 1 ]]; then
        echo "`readlink -f ${env_path}`"
        return 0
    else
        return 1
    fi
}

# Override cd to automatically switch venv
function cd () {
    builtin cd "$@"  # Execute the builtin cd command

    # Switch to the nearest venv, or deactivate if there isn't one
    venv="`nearest_venv`"
    if [[ $? -eq 0 ]]; then
        source "${venv}/bin/activate"
    else
        if [[ ! -z "${VIRTUAL_ENV}" ]]; then
            deactivate
        fi
    fi
}

if type bashrc_ps1_before >/dev/null 2>&1; then
    export VIRTUAL_ENV_DISABLE_PROMPT=1  # Don't show the default prompt

    bashrc_venv_prompt() {
        if [[ ! -z "${VIRTUAL_ENV}" ]]; then
            echo -n "(env) "
        fi
    }

    bashrc_ps1_before "bashrc_venv_prompt"
fi

# Automatically switch to the current venv when the shell opens
cd .
